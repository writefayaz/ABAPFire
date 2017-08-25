class ZCX_ABAPFIRE_FIREBASE definition
  public
  inheriting from CX_STATIC_CHECK
  final
  create public .

public section.

  interfaces IF_T100_MESSAGE .

  data RAISE_ATTR1 type STRING .

  methods CONSTRUCTOR
    importing
      !TEXTID like IF_T100_MESSAGE=>T100KEY optional
      !PREVIOUS like PREVIOUS optional
      !RAISE_ATTR1 type STRING optional .
  class-methods RAISE
    importing
      !IV_TEXT type CLIKE
    raising
      ZCX_ABAPFIRE_FIREBASE .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCX_ABAPFIRE_FIREBASE IMPLEMENTATION.


  method CONSTRUCTOR.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
PREVIOUS = PREVIOUS
.
me->RAISE_ATTR1 = RAISE_ATTR1 .
clear me->textid.
if textid is initial.
  IF_T100_MESSAGE~T100KEY = IF_T100_MESSAGE=>DEFAULT_TEXTID.
else.
  IF_T100_MESSAGE~T100KEY = TEXTID.
endif.
  endmethod.


  METHOD raise.
    DATA lv_text LIKE if_t100_message=>t100key.

    DATA: BEGIN OF lv_msg,
            msgid TYPE symsgid VALUE 'ZABAPFIRE_MSG',
            msgno TYPE symsgno VALUE '000',
            attr1 TYPE scx_attrname VALUE 'RAISE_ATTR1',
            attr2 TYPE scx_attrname VALUE '',
            attr3 TYPE scx_attrname VALUE '',
            attr4 TYPE scx_attrname VALUE '',
          END OF lv_msg .

    RAISE EXCEPTION TYPE zcx_abapfire_firebase
      EXPORTING
        textid      = lv_msg
        raise_attr1 = iv_text.
  ENDMETHOD.
ENDCLASS.
