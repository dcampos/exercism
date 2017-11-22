unit module HelloWorld:ver<2>;

sub hello($name = "World") is export {
    "Hello, $name!";
}
