#!/usr/bin/env python
# -*- coding: utf-8 -*-


try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup


# Let us be bad
readme = open('README.md').read()
history = ''

requirements = [
    'cloudpickle'
]

test_requirements = [
    # TODO: put package test requirements here
]

setup(
    name='multyvacinit',
    version='0.1.0',
    description='multyvacinit for cloudpipe',
    long_description=readme + '\n\n' + history,
    author='Kyle Kelley',
    author_email='rgbkrk@gmail.com',
    url='https://github.com/rgbkrk/multyvacinit',
    packages=[
        'multyvacinit',
    ],
    package_dir={'multyvacinit':
                 'multyvacinit'},
    include_package_data=True,
    install_requires=requirements,
    license="BSD",
    zip_safe=False,
    keywords='multyvacinit',
    classifiers=[
        'Development Status :: 2 - Pre-Alpha',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: BSD License',
        'Natural Language :: English',
        "Programming Language :: Python :: 2",
        'Programming Language :: Python :: 2.6',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.3',
        'Programming Language :: Python :: 3.4',
    ],
    test_suite='tests',
    tests_require=test_requirements
)
