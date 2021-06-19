/*            
                                            O ��������

����������, � �� �� ����� �� �� ������, ����������:
  1) ������ ���� ���� �������, �������� �� ����� �������, ����� ���������������, ���� ���� �� ����� ����.
  2) ������ ������� � ����� ����� ���� ������� ��� ������ �� ����� �������.
  3) ������� �������, �� ������� ���� �������, �� ����� ����, ���� ������ �� �� ����� ���������������.
  4) ������ �������, � �������� ���� ��� ���� � ������� ����� ����, ������ �� ����� �������.
  5) �� � ������ �������, �������� ���������������, ��� ���� �������.
���� �� ����� ���������� ��, ��� ����� ������� � ��������, ������� ����� ����?
*/


DOMAINS 
        ��������, ������ = symbol
        �������� = ��������(��������, ������)
        ������� = ��������*
        ������_������� = �������*
/* ��� ��� ������������ � ��� �����, ������� ���������� "�����_������������" */
        �����_������������=integer

PREDICATES
        nondeterm ���������_������(������)
        nondeterm ������_�(��������, �������)
        nondeterm ������_�(�������, ������_�������)
        nondeterm �����_���(�����_������������, �������)
        nondeterm ���������_��������(�������)
        nondeterm ������_����_�������(������_�������)
        nondeterm �����_������(������_�������, ������_�������)
        nondeterm �����_�������(��������, ������)
CLAUSES 

���������_������(��).
���������_������(���).


%   �������������� �������� ������
������_�(������,[������|_]).
������_�(������,[_|�����]):-������_�(������,�����).
       
/* 
������������ 1. 
������ ���� ���� �������, �������� �� ����� �������, ����� ���������������, ���� ���� �� ����� ����.
*/       

�����_���(1, �������):- ������_�(��������(�����_����_�������, ��), �������), ������_�(��������(������_�������, ��), �������),
������_�(��������(�����_���������������, ��), �������).
�����_���(1, �������):- ������_�(��������(�����_����_�������, ���), �������); ������_�(��������(������_�������, ���), �������).

/* 
������������ 2. 
������ ������� � ����� ����� ���� ������� ��� ������ �� ����� �������.
*/          

�����_���(2, �������):- ������_�(��������(�����_����, ��), �������), ������_�(��������(�����_����_�������, ��), �������);
                        ������_�(��������(�����_����, ��), �������), ������_�(��������(������_�������, ��), �������).
�����_���(2, �������):- ������_�(��������(�����_����, ���), �������).

/* 
������������ 3. 
������� �������, �� ������� ���� �������, �� ����� ����, ���� ������ �� �� ����� ���������������.
*/         

�����_���(3, �������):- ������_�(��������(�����_����_�������, ���), �������), ������_�(��������(�����_����, ���), �������),
������_�(��������(�����_���������������, ���), �������).
�����_���(3, �������):- ������_�(��������(�����_����_�������, ���), �������), ������_�(��������(�����_����, ��), �������),
������_�(��������(�����_���������������, ��), �������).
�����_���(3, �������):- ������_�(��������(�����_����_�������, ��), �������).

/*
������������ 4.
������ �������, � �������� ���� ��� ���� � ������� ����� ����, ������ �� ����� �������.
*/

�����_���(4, �������):- ������_�(��������(�����_����_�������, ��), �������), ������_�(��������(�����_����, ��), �������),
������_�(��������(������_�������, ��), �������).
�����_���(4, �������):- ������_�(��������(�����_����_�������, ���), �������); ������_�(��������(�����_����, ���), �������).

/*
������������ 5.
�� � ������ �������, �������� ���������������, ��� ���� �������.
*/

�����_���(5, �������):- ������_�(��������(�����_���������������, ��), �������), ������_�(��������(�����_����_�������, ���), �������).
�����_���(5, �������):- ������_�(��������(�����_���������������, ���), �������).


���������_��������(�������):-
���������_������(������_1), ���������_������(������_2),
���������_������(������_3), ���������_������(������_4),

������� = [��������(�����_����_�������, ������_1), ��������(������_�������, ������_2),
           ��������(�����_���������������, ������_3), ��������(�����_����, ������_4)],

�����_���(1, �������),
�����_���(2, �������),
�����_���(3, �������),
�����_���(4, �������),
�����_���(5, �������).

������_����_�������(������):- findall(��������, ���������_��������(��������), ������).
% ���������� ������������� �������
�����_������([���������], [���������]).
�����_������([������|�����_������], ��������_������) :- �����_������(�����_������, ��������_������_1),
                                                        not(������_�(������, ��������_������_1)),
                                                        ��������_������ = [������|��������_������_1].
�����_������([������|�����_������], ��������_������) :- �����_������(�����_������, ��������_������_1),
                                                        ������_�(������, ��������_������_1),
                                                        ��������_������ = ��������_������_1.
�����_�������(��������, ������):- ������_����_�������(������),
                         �����_������(������, ������_���_������),
                         %���� �� ����� ���������� ��, ��� ����� ������� � ��������, ������� ����� ����?
                         ������_�(�������, ������_���_������),
                         ������_�(��������(�����_����, ��), �������),
                         ������_�(��������(��������, ������), �������).
Goal

write("�_�������_�������_�����_����_�����_�������:"),nl,
�����_�������(��������, ������_��������).




