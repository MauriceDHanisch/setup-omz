from setuptools import setup, find_packages

setup(
    name="setup-omz",
    version="0.1.0",
    packages=find_packages(),
    include_package_data=True,  # Ensures non-Python files (like .zshrc and theme) are included
    install_requires=[],
    entry_points={
        "console_scripts": [
            "setup-omz=setup_omz.setup_omz:main"
        ]
    },
    author="Maurice D. Hanisch",
    author_email="maurhanisch@gmail.com",
    description="Automates Oh My Zsh setup with plugins, themes, and Conda.",
    url="None",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: POSIX :: Linux",
    ],
    python_requires=">=3.6",
)
