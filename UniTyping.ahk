
#SingleInstance Force

listening := False
listening_ref := &listening
input_str := ""
input_ref := &input_str
counter := 1
counter_ref := &counter


send_uni(char)
{
    if(%listening_ref%)
    {
            %input_ref% .= char
            ++%counter_ref%       
    }
}

%::
{
    Send "{U+0025}"
    %listening_ref% := True
    TrayTip "Press [SPACE] to cancel/finish.", "UniTyping is now listening!"
}

1::
{
    Send "{U+0031}"
    send_uni(1)
}

2::
{
    Send "{U+0032}"
    send_uni(2)
}

3::
{
    Send "{U+0033}"
    send_uni(3)
}

4::
{
    Send "{U+0034}"
    send_uni(4)
}

5::
{
    Send "{U+0035}"
    send_uni(5)
}

6::
{
    Send "{U+0036}"
    send_uni(6)
}

7::
{
    Send "{U+0037}"
    send_uni(7)
}

8::
{
    Send "{U+0038}"
    send_uni(8)
}

9::
{
    Send "{U+0039}"
    send_uni(9)
}

a::
{
    Send "{U+0061}"
    send_uni("a")
}

b::
{
    Send "{U+0062}"
    send_uni("b")
}

c::
{
    Send "{U+0063}"
    send_uni("c")
}

d::
{
    Send "{U+0064}"
    send_uni("d")
}

e::
{
    Send "{U+0065}"
    send_uni("e")
}

f::
{
    Send "{U+0066}"
    send_uni("f")
}

Space::
{
    if(%listening_ref%)
    {
        TrayTip
        TrayTip "", "UniTyping has stopped listening!"

        hexa := ""

        Loop %counter_ref%
        {
            hexa .= "{BS}"
        }

        %listening_ref% := False
        hexa .= "{U+"
        hexa .= %input_ref%
        hexa .= "}"
        %input_ref% := ""
        %counter_ref% := 1
        Send hexa
    }
    Send "{U+0020}"
}

$BS::
{
    SendInput "{BS}"
    if(%listening_ref%)
    {
        len := StrLen(%input_ref%)
        if(len>0)
        {
            %input_ref% := SubStr(%input_ref%, 1, len-1)
            --%counter_ref%
        }
    }
}
