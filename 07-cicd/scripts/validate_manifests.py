from pathlib import Path
import sys
import yaml

PROJECT_ROOT = Path(__file__).resolve().parents[2]
MANIFEST_DIR = PROJECT_ROOT / "06-kubernetes" / "manifests"

EXPECTED_FILES = [
    "namespace.yaml",
    "configmap.yaml",
    "secret.yaml",
    "deployment.yaml",
    "service.yaml",
    "hpa.yaml",
]

def validate_manifest(file_path):
    try:
        with file_path.open("r", encoding="utf-8") as file:
            documents = list(yaml.safe_load_all(file))

        if not documents:
            raise ValueError("File contains no YAML documents")

        for index, document in enumerate(documents, start=1):
            if not isinstance(document, dict):
                raise ValueError(
                    f"Document {index} must contain a YAML object"
                )

            required_fields = ["apiVersion", "kind", "metadata"]

            for field in required_fields:
                if field not in document:
                    raise ValueError(
                        f"Document {index} is missing '{field}'"
                    )

            metadata = document["metadata"]

            if not isinstance(metadata, dict) or not metadata.get("name"):
                raise ValueError(
                    f"Document {index} has missing or invalid metadata.name"
                )

        print(f"PASS: {file_path.name}")
        return True

    except (yaml.YAMLError, OSError, ValueError) as error:
        print(f"FAIL: {file_path.name}: {error}")
        return False


def main():
    print("Kubernetes Manifest Validation")
    print("=" * 35)

    if not MANIFEST_DIR.is_dir():
        print(f"ERROR: Manifest directory not found: {MANIFEST_DIR}")
        return 1

    results = []

    for filename in EXPECTED_FILES:
        file_path = MANIFEST_DIR / filename

        if not file_path.is_file():
            print(f"FAIL: {filename}: File not found")
            results.append(False)
            continue

        results.append(validate_manifest(file_path))

    print("=" * 35)
    passed = sum(results)
    failed = len(results) - passed

    print(f"Total: {len(results)}")
    print(f"Passed: {passed}")
    print(f"Failed: {failed}")

    return 0 if failed == 0 else 1


if __name__ == "__main__":
    sys.exit(main())