

from tornado.template import Template, DictLoader, ParseError, Loader

def test_render_string():
    template = Template("Hello {{ name }}!")
    print template.generate(name="Ben")

def test_include():
    loader = DictLoader({
            "index.html": '{% include "header.html" %}\nbody text',
            "header.html": "header text",
            })
    print loader.load("index.html").generate()

def main():
    pass

if __name__ == '__main__':
    main()