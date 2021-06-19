/*��� ������, �����, � ����� ����� ������, � ��� �������� ���� �� ����� �������� ��������, �� ������� �� ���� ������� ���������.
��� ��� ������ � ��� ������, ���������� ���� ����, � �������� �� ��� ��� ������ ����.
����� ������� ����������� ��������, �������� �� �� ���� ��������, �� ����� ��� �������: �� �� ���, �� �� ����, ���� ��� ������, � ������ �� ��������.
����� �������� ������� �����������, �������� �� �� ���� ��������. ����� ����� ��� �����������: �� �� ���, �� �� ����, ���� ��� ������, � ����� �� �����.
����� �������� �������� �����������, ������� ��� ��������� ������ ����������, � ������ ���������� ���� �������, ��� ������ ���������� ���������, ���� ���������,
��� ������ ���������� �������. �� ��� ������ ������� ������ ����������, ��������� �� ���� ������. ���� �� � ���� ���� �� �������� ������������� � ���, ��� �������? 
� ����������, ���! � �������� �����. 
� � ���� �� ����� ���������� ���������, � ��������� ����� ������.����� � ����� ��� ���-���: 
� �����������, ��� �� ���������� ������� ������ � ��� ����, �� ������ �����, ��� �� ������� ���� ���� �� ��� ������� ������ � �� ������� ���� ���� �� ��� ����.
������ �� �� ������ ����������, ��� �������? 
� ����������, ���! ��������� �����. 
� � ���� �� ����� ���������� ���������, ������� ����� ������,���, ���� ��� ���� ���� ���-�� �������, ������� ��� �������� ����, ��� �� ������� ������ � ���������� ����������,
������� �������� ������������� ���� � ��������. � �� ����� � ��� ������, ��� ������ ������� ������ ����������, � ���������� ���������� ��������� ���� ����������.
����� ����, � ������� ����������, ��� �� ������� ���� ���� �� ���� ���������� ������� ������ � �� ������� ���� ���� ����.
����� �� ����, ��������� ����� ���������� ������������� ����� ����� ���������. 
������ ��� � ����� (�, �������������, � ���) ������� ���������� ���������� ��� ����, ����� ������ ������. 
��� �������?*/
DOMAINS
    �����, ����������      = integer
    ����, �����, ��������� = symbol
    ������_���������       = �����*
    ����������             = ����������(�����, �����, ����, ���������)
    ������_����������      = ����������*
    ������_�������         = ������_����������*
PREDICATES
    nondeterm ���������_����                        (����)
    nondeterm ���������_���������                   (�����)
    nondeterm �����                                 (�����, ����)
    nondeterm ���������_���������                   (���������)
    nondeterm �����                                 (������_����������, ����������)
    nondeterm �����_���������                       (������_���������, �����, �����)
    nondeterm ������                                (�����, �����, ����, ���������, ������_����������)
    nondeterm ��������_���������                    (������_����������, �����)
    nondeterm ����������_��������                   (������_����������, ����������)
    nondeterm ����������_��_���������               (������_����������, ����������, ���������)
    nondeterm �������_�_����������_��������         (������_����������)
    nondeterm �������_�_����������_�������_�_������ (������_����������)
    nondeterm ���������_��������                    (������_���������, ������_����������)
    nondeterm �����_���������_�������               (������_���������, ������_�������)
    nondeterm �����_������                          (������_�������)
    nondeterm ��������_��������                     (������_����������)
    nondeterm �����_�������                         (�����)
CLAUSES               
%���������� ��������� ���� ����������
    ���������_����(�������).
    ���������_����(���������).        
%���������� ��������� ���������
    ���������_���������(��).
    ���������_���������(���).        
%���������� ��������� ��������� ����������
    ���������_���������(�������).
    ���������_���������(����).        
%���������� ����� ����������� �� ������
    �����([ ������ | _ ], ������).
    �����([ _ | �����_������ ], ������)
    :-
        �����(�����_������, ������)
    .
%���������� ����� ��������� �� ������ �� ������
    �����_���������([ ������ | _ ], �����, ������)
    :-
        ����� - 1 = 0
    .
    �����_���������([ _ | �����_������ ], �����, ������)
    :- 
        �����_1 = ����� - 1,
        �����_���������(�����_������, �����_1, ������)
    .
%���������� ���������
    ������(1, ������, ����, ���������, ����������)
    :-
        �����(����������, ����������(1, ������, ����, ���������))
    .
    ������(2, ������, ����, ���������, ����������)
    :-
        �����(����������, ����������(2, ������, ����, ���������))
    .
    ������(3, ������, ����, ���������, ����������)
    :-
        �����(����������, ����������(1, _, ����, _)),
        �����(����������, ����������(3, ������, _, ���������))
    .
%���������� ����������� ������������
    �����(��, �������).
    �����(���, ���������).
%���������� �������� ���������
    ��������_���������(����������, �����)
    :-
        ������(�����, ������, ����, �������, ����������),
        �����(������, ���������),
	    ���� = ���������
    .
    ��������_���������(����������, �����)
    :-
        ������(�����, ������, ����, ����, ����������),
        �����(������, ���������),
	    not(���� = ���������)
    .
%���������� ������� �������� ����������
	����������_��������([], 0).
	����������_��������([ ������ | �����_������ ], ����������)
    :-
        ����������_��������(�����_������, ����������_1),
        ������ = ����������(_, _, �������, _),
	    ���������� = ����������_1 + 1
    .
	����������_��������([ ������ | �����_������ ], ����������)
    :-
        ����������_��������(�����_������, ����������_1),
        ������ = ����������(_, _, ���������, _),
	    ���������� = ����������_1
    .
%���������� ������� � ���������� ��������
    �������_�_����������_��������(����������)
    :-
        ����������_��������(����������, ����������),
        ���������� = 1
    .
%���������� ������� ������� � ������ ����������
	����������_��_���������([], 0, _).
	����������_��_���������([ ������ | �����_������ ], ����������, ���������)
    :-
        ����������_��_���������(�����_������, ����������_1, ���������),
	    ������ = ����������(_, _, _, ���������),
	    ���������� = ����������_1 + 1
    .
	����������_��_���������([ ������ | �����_������ ], ����������, ���������)
    :-
        ����������_��_���������(�����_������, ����������_1, ���������),
	    not(������ = ����������(_, _, _, ���������)),
	    ���������� = ����������_1
    .
%���������� ������� � ���������� ������� � ������
    �������_�_����������_�������_�_������(����������)
    :-
        ����������_��_���������(����������, ����������_1, �������),
        ����������_��_���������(����������, ����������_2, ����),
        not(����������_1 = 0), not(����������_2 = 0)
    .
%���������� ��������� �������� � �� ��������
    ���������_��������(���������, ����������):-
		���������_����(����_1),
		���������_����(����_2),
		���������_����(����_3),
		
		���������_���������(���������_1),
		���������_���������(���������_2),
		���������_���������(���������_3),
		
		�����_���������(���������, 1, ������_1),
		�����_���������(���������, 2, ������_2),
		�����_���������(���������, 3, ������_3),
		
		���������� = 
        [
            ����������(1, ������_1, ����_1, ���������_1),
		    ����������(2, ������_2, ����_2, ���������_2),
		    ����������(3, ������_3, ����_3, ���������_3)
        ],

		%��������
		�������_�_����������_��������(����������),
		�������_�_����������_�������_�_������(����������),
		��������_���������(����������, 1),
		��������_���������(����������, 2),
		��������_���������(����������, 3)
    .
%���������� ������ ������� �������
    �����_���������_�������(���������, ������_�������)
    :-
        findall
        (
            ��������,
            ���������_��������(���������, ��������),
            ������_�������
        )
    .
%���������� �������� ��������(������� �� ������, � ������� ���� ������ ���� ��������)
    ��������_��������(��������)
    :-
		���������_���������(������_1),
		���������_���������(������_2),
		���������_���������(������_3),
		
        ��������� = [������_1, ������_2, ������_3],
        �����_���������_�������(���������, ������_�������),
        %������� ������ ���� ������������
        ������_������� = [��������]
    .
%���������� ������ �������� �������(����� ���� ��������� ������� � ����������� ���������)
    �����_������(������_������)
    :-
        findall
        (
            ��������,
            ��������_��������(��������),
            ������_������
        )
    .
%���������� ���������� ����� ��������� �� �������� ��������
    �����_�������(�����)
    :-
        �����_������(������_������),
        ������_������ = [ �������� | _ ],                    %����� ������� ����� �������� �� ������, �.�. �������� ����������
        �����(��������, ����������(�����, _, �������, _))    % ���� �� �������� ���� �� �� �����������, ������ �� �� ��������
    .
GOAL
    �����_�������(�������_����������_�����).