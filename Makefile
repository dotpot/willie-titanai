# sets up the virtual environment
setup: venv/_venv_setup_done venv/_venv_packages_installed

clean:
	rm -rf venv && find . -name "*.pyc" -exec rm -rf {} \;

run: setup
    python willie.py
    
venv/_venv_setup_done:
	export PATH=$$PATH:$$HOME/Library/Python/2.7/bin:$$HOME/.local/lib/python2.7/bin \
	&& virtualenv --version > /dev/null 2>&1 || pip install --user virtualenv \
	&& virtualenv venv \
	&& touch venv/_venv_setup_done

venv/_venv_packages_installed: requirements.txt
	. venv/bin/activate \
	&& pip install --download-cache=./.tmp/pip_cache_dir -r requirements.txt --use-mirrors \
	&& patch -p1 < misc/venv-patches/web-application-py-integration-with-paste.patch \
	&& touch venv/_venv_packages_installed
