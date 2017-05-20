# -*- coding: utf-8 -*-
"""Definitions."""

BYTE_ORDER_BIG_ENDIAN = u'big-endian'
BYTE_ORDER_LITTLE_ENDIAN = u'little-endian'
BYTE_ORDER_MIDDLE_ENDIAN = u'middle-endian'
BYTE_ORDER_NATIVE = u'native'

BYTE_ORDERS = frozenset([
    BYTE_ORDER_BIG_ENDIAN,
    BYTE_ORDER_LITTLE_ENDIAN,
    BYTE_ORDER_NATIVE])

FORMAT_SIGNED = u'signed'
FORMAT_UNSIGNED = u'unsigned'

SIZE_NATIVE = u'native'

TYPE_INDICATOR_BOOLEAN = u'boolean'
TYPE_INDICATOR_CHARACTER = u'character'
TYPE_INDICATOR_CONSTANT = u'constant'
TYPE_INDICATOR_ENUMERATION = u'enumeration'
TYPE_INDICATOR_FLOATING_POINT = u'floating-point'
TYPE_INDICATOR_FORMAT = u'format'
TYPE_INDICATOR_INTEGER = u'integer'
TYPE_INDICATOR_SEQUENCE = u'sequence'
TYPE_INDICATOR_STREAM = u'stream'
TYPE_INDICATOR_STRING = u'string'
TYPE_INDICATOR_STRUCTURE = u'structure'
TYPE_INDICATOR_UNION = u'union'
TYPE_INDICATOR_UUID = u'uuid'

TYPE_INDICATORS = frozenset([
    TYPE_INDICATOR_BOOLEAN,
    TYPE_INDICATOR_CHARACTER,
    TYPE_INDICATOR_CONSTANT,
    TYPE_INDICATOR_ENUMERATION,
    TYPE_INDICATOR_FLOATING_POINT,
    TYPE_INDICATOR_FORMAT,
    TYPE_INDICATOR_INTEGER,
    TYPE_INDICATOR_SEQUENCE,
    TYPE_INDICATOR_STREAM,
    TYPE_INDICATOR_STRING,
    TYPE_INDICATOR_STRUCTURE,
    TYPE_INDICATOR_UNION,
    TYPE_INDICATOR_UUID])
