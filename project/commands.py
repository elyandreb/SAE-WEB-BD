"""module sqlalchemy
"""
from sqlalchemy.sql import text
from .app import app, db
from .models import TriggerManager


def execute_sql_file(filename):
    """Exécute un fichier SQL ligne par ligne."""
    with app.app_context():
        with open(filename, 'r', encoding='utf-8') as file:
            sql_commands = file.read().split(';')
            for command in sql_commands:
                if command.strip():  # Ignorer les lignes vides
                    db.session.execute(
                        text(command))  # Utilisation explicite de `text`
            db.session.commit()


@app.cli.command("syncdb")
def syncdb():
    """Synchronise la base de données avec les fichiers SQL."""
    print("Suppression des tables existantes...")
    execute_sql_file('BD/drop.sql')

    print("Création des tables...")
    execute_sql_file('BD/creation_grand_galop.sql')

    print("Mise en place des triggers...")
    TriggerManager()

    print("Insertion des données...")
    execute_sql_file('BD/insertion_grand_galop.sql')

    print("Base de données synchronisée avec succès !")
