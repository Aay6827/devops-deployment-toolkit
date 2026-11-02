from pathlib import Path
from collections import Counter
import re


LOG_FILE = (
    Path(__file__).resolve().parent.parent
    / "sample-data"
    / "application.log"
)

SEVERITY_PATTERN = re.compile(r"\b(DEBUG|INFO|WARNING|ERROR|CRITICAL)\b")
SERVICE_PATTERN = re.compile(r"\bservice=([^\s]+)")
CORRELATION_PATTERN = re.compile(r"\bcorrelation_id=([^\s]+)")


def analyze_logs(file_path: Path) -> dict:
    """Read a log file and summarise severity and service counts."""

    if not file_path.exists():
        raise FileNotFoundError(f"Log file not found: {file_path}")

    severity_counts = Counter()
    service_counts = Counter()
    correlation_ids = set()
    error_events = []
    total_lines = 0

    with file_path.open("r", encoding="utf-8") as log_file:
        for line_number, line in enumerate(log_file, start=1):
            line = line.strip()

            if not line:
                continue

            total_lines += 1

            severity_match = SEVERITY_PATTERN.search(line)
            service_match = SERVICE_PATTERN.search(line)
            correlation_match = CORRELATION_PATTERN.search(line)

            if severity_match:
                severity = severity_match.group(1)
                severity_counts[severity] += 1

                if severity in ("ERROR", "CRITICAL"):
                    error_events.append({
                        "line": line_number,
                        "severity": severity,
                        "message": line
                    })

            if service_match:
                service_counts[service_match.group(1)] += 1

            if correlation_match:
                correlation_ids.add(correlation_match.group(1))

    return {
        "total_lines": total_lines,
        "severity_counts": dict(severity_counts),
        "service_counts": dict(service_counts),
        "unique_correlation_ids": len(correlation_ids),
        "error_events": error_events
    }


def main():
    try:
        results = analyze_logs(LOG_FILE)

        print("\nAPPLICATION LOG ANALYSIS")
        print("=" * 40)

        print(f"Total log records: {results['total_lines']}")
        print(
            "Unique correlation IDs: "
            f"{results['unique_correlation_ids']}"
        )

        print("\nSEVERITY SUMMARY")
        for severity, count in sorted(
            results["severity_counts"].items()
        ):
            print(f"{severity}: {count}")

        print("\nSERVICE SUMMARY")
        for service, count in sorted(
            results["service_counts"].items()
        ):
            print(f"{service}: {count}")

        print("\nERROR AND CRITICAL EVENTS")
        for event in results["error_events"]:
            print(
                f"Line {event['line']} | "
                f"{event['severity']} | {event['message']}"
            )

        print("\nAnalysis completed.")

    except FileNotFoundError as error:
        print(f"ERROR: {error}")
    except OSError as error:
        print(f"Unable to read log file: {error}")


if __name__ == "__main__":
    main()