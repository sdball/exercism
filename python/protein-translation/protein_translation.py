def proteins(strand):
    codons = strand_to_codons(strand)
    return codons_to_proteins(codons, [])

def strand_to_codons(strand):
    return [strand[i:i+3] for i in range(0, len(strand), 3)]

def codons_to_proteins(codons, identified_proteins):
    if not codons:
        return identified_proteins
    next_protein = codon_to_protein(codons[0])
    if next_protein == 'STOP':
        return identified_proteins
    else:
        identified_proteins.append(next_protein)
        return codons_to_proteins(codons[1:], identified_proteins)

def codon_to_protein(codon):
    return {
        'AUG': 'Methionine',
        'UUU': 'Phenylalanine',
        'UUC': 'Phenylalanine',
        'UUA': 'Leucine',
        'UUG': 'Leucine',
        'UCU': 'Serine',
        'UCC': 'Serine',
        'UCA': 'Serine',
        'UCG': 'Serine',
        'UAU': 'Tyrosine',
        'UAC': 'Tyrosine',
        'UGU': 'Cysteine',
        'UGC': 'Cysteine',
        'UGG': 'Tryptophan',
        'UAA': 'STOP',
        'UAG': 'STOP',
        'UGA': 'STOP',
    }.get(codon)

