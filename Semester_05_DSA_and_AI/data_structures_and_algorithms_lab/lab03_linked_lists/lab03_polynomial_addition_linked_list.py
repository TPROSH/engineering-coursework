def create_poly_node(coeff, exp, next_node=None):
    return {"coeff": coeff, "exp": exp, "next": next_node}

def print_poly(head):
    curr = head
    terms = []
    while curr:
        terms.append(f"{curr['coeff']}x^{curr['exp']}")
        curr = curr["next"]
    print(" + ".join(terms) if terms else "0")

def add_polynomials(poly1, poly2):
    dummy = {"coeff": 0, "exp": 0, "next": None}
    tail = dummy

    p1 = poly1
    p2 = poly2

    while p1 and p2:
        if p1["exp"] == p2["exp"]:
            sum_coeff = p1["coeff"] + p2["coeff"]
            if sum_coeff != 0:
                tail["next"] = create_poly_node(sum_coeff, p1["exp"])
                tail = tail["next"]
            p1 = p1["next"]
            p2 = p2["next"]
        elif p1["exp"] > p2["exp"]:
            tail["next"] = create_poly_node(p1["coeff"], p1["exp"])
            tail = tail["next"]
            p1 = p1["next"]
        else:
            tail["next"] = create_poly_node(p2["coeff"], p2["exp"])
            tail = tail["next"]
            p2 = p2["next"]

    while p1:
        tail["next"] = create_poly_node(p1["coeff"], p1["exp"])
        tail = tail["next"]
        p1 = p1["next"]

    while p2:
        tail["next"] = create_poly_node(p2["coeff"], p2["exp"])
        tail = tail["next"]
        p2 = p2["next"]

    return dummy["next"]

# Hardcoded Polynomial 1: 5x^4 + 3x^2 + 10x^0
p1_node3 = {"coeff": 10, "exp": 0, "next": None}
p1_node2 = {"coeff": 3, "exp": 2, "next": p1_node3}
p1_node1 = {"coeff": 5, "exp": 4, "next": p1_node2}
poly1 = p1_node1

# Hardcoded Polynomial 2: 4x^3 + 2x^2 + 7x^0
p2_node3 = {"coeff": 7, "exp": 0, "next": None}
p2_node2 = {"coeff": 2, "exp": 2, "next": p2_node3}
p2_node1 = {"coeff": 4, "exp": 3, "next": p2_node2}
poly2 = p2_node1

print("Polynomial 1:")
print_poly(poly1)

print("\nPolynomial 2:")
print_poly(poly2)

result_poly = add_polynomials(poly1, poly2)
print("\nSum:")
print_poly(result_poly)