from pathlib import Path

import pytest

from log_analyzer import analyze_logs


@pytest.fixture
def sample_log(tmp_path):
    log_file = tmp_path / "application.log"

    log_file.write_text(
        "2026-11-03T09:00:00Z INFO service=order-service "
        "correlation_id=COR-1001 message=\"Order created\"\n"
        "2026-11-03T09:01:00Z ERROR service=payment-service "
        "correlation_id=COR-1002 message=\"Payment failed\"\n"
        "2026-11-03T09:02:00Z CRITICAL service=inventory-service "
        "correlation_id=COR-1003 message=\"Database unavailable\"\n"
        "2026-11-03T09:03:00Z WARNING service=order-service "
        "correlation_id=COR-1001 message=\"Order delayed\"\n",
        encoding="utf-8"
    )

    return log_file


def test_total_log_records(sample_log):
    result = analyze_logs(sample_log)

    assert result["total_lines"] == 4


def test_severity_counts(sample_log):
    result = analyze_logs(sample_log)

    assert result["severity_counts"]["INFO"] == 1
    assert result["severity_counts"]["WARNING"] == 1
    assert result["severity_counts"]["ERROR"] == 1
    assert result["severity_counts"]["CRITICAL"] == 1


def test_service_counts(sample_log):
    result = analyze_logs(sample_log)

    assert result["service_counts"]["order-service"] == 2
    assert result["service_counts"]["payment-service"] == 1
    assert result["service_counts"]["inventory-service"] == 1


def test_unique_correlation_ids(sample_log):
    result = analyze_logs(sample_log)

    assert result["unique_correlation_ids"] == 3


def test_error_events(sample_log):
    result = analyze_logs(sample_log)

    assert len(result["error_events"]) == 2
    assert result["error_events"][0]["severity"] == "ERROR"
    assert result["error_events"][1]["severity"] == "CRITICAL"


def test_missing_log_file():
    missing_file = Path("missing-application.log")

    with pytest.raises(FileNotFoundError):
        analyze_logs(missing_file)