import importlib.util
from pathlib import Path

SCRIPT_PATH = (
    Path(__file__).resolve().parents[1]
    / "scripts"
    / "validate_manifests.py"
)

spec = importlib.util.spec_from_file_location(
    "validate_manifests",
    SCRIPT_PATH
)

validator = importlib.util.module_from_spec(spec)
spec.loader.exec_module(validator)


def test_valid_manifest(tmp_path, capsys):
    manifest = tmp_path / "valid.yaml"

    manifest.write_text(
        """
apiVersion: v1
kind: Namespace
metadata:
  name: test-namespace
""",
        encoding="utf-8",
    )

    assert validator.validate_manifest(manifest) is True
    assert "PASS: valid.yaml" in capsys.readouterr().out


def test_missing_metadata_name(tmp_path, capsys):
    manifest = tmp_path / "invalid.yaml"

    manifest.write_text(
        """
apiVersion: v1
kind: Namespace
metadata: {}
""",
        encoding="utf-8",
    )

    assert validator.validate_manifest(manifest) is False
    assert "FAIL: invalid.yaml" in capsys.readouterr().out


def test_missing_required_field(tmp_path, capsys):
    manifest = tmp_path / "missing-field.yaml"

    manifest.write_text(
        """
kind: Namespace
metadata:
  name: test-namespace
""",
        encoding="utf-8",
    )

    assert validator.validate_manifest(manifest) is False
    assert "FAIL: missing-field.yaml" in capsys.readouterr().out


def test_invalid_yaml(tmp_path, capsys):
    manifest = tmp_path / "broken.yaml"

    manifest.write_text(
        """
apiVersion: v1
kind: Namespace
metadata:
  name: [invalid
""",
        encoding="utf-8",
    )

    assert validator.validate_manifest(manifest) is False
    assert "FAIL: broken.yaml" in capsys.readouterr().out


def test_empty_yaml_file(tmp_path, capsys):
    manifest = tmp_path / "empty.yaml"
    manifest.write_text("", encoding="utf-8")

    assert validator.validate_manifest(manifest) is False
    assert "FAIL: empty.yaml" in capsys.readouterr().out