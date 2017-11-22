unit class LinkedList:ver<1>;

class Node {
    has Node $.next is rw;
    has Node $.previous is rw;
    has $.value;
}

has $!front;
has $!end;

method push-list($value) {
    my $node = Node.new(:value($value));
    $node.previous = $!end // $node;

    $!end.next = $node if $!end;

    $!end = $node;
    $!front //= $node;
}

method pop-list() {
    my $node = $!end;
    $!end = $node.previous;
    return $node.value;
}

method shift-list() {
    my $node = $!front;
    $!front = $node.next;
    return $node.value;
}

method unshift-list($value) {
    my $node = Node.new(:value($value));
    $node.next = $!front // $node;

    $!front.previous = $node if $!front;

    $!front = $node;
    $!end //= $node;
}

