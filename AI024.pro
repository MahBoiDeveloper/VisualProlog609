/*
                                         ��������� I
������� �����, �����, ���� � ����� �������� ���� ����.
����, ������ ��� ����, ������-�������� ��������, ����� �� ������ ������,
�� �� �����������, ����� �� ���� ����������� � ������� � ������� ��������, �������������� �� ����.
������� ����������� (��� ����� �������� ���������), ������ ������, 
��� ����� ���� ��������� �����, �� ������� � ����� �� ���� ���� ������� �� �������� ���������� �������,
����� �������� - ������� �����, � ������-������� ����� ��������, �������� � ������ ��������� �����.
������������� ����� ������������� ��������:
�����.  (1)  � �� ������������ ������� � ��������.
        (2)  ����� � ����� � �����, ��� ��� ��� �����.
        (3)  ����� ����� � ����� ����� ����.
�����.  (4)  � �� ����������� ������� � ��������.
        (5)  ����� � ����� � �����, ��� ��� ���� �����.
        (6)  ����� ����� � ����� ����� ����.
����.   (7)  ��� �� � ������� �������.
        (8)  � ����� � ����� ����.
        (9)  ����� � ����� � �����, ��� ��� ��������� �����.
�����.  (10) ��� �� � ��������� ���� �� ���.
        (11) ����� � � ��������� ��� ������� �� �����, ��� �������� ������� ������.
        (12) ����� ����� � ����� �� ����.
���� ������ ����� ��� ��������� �������� �, �������� ������, ��������� � ���,
��� ��� ��������� ��������� ��� ���� ���, ��� ��������� ����� �� �����,
��������� ���� ����� ��������� ������������ ���� ����� ���������� �������������,
� ���� ��� ��������� ���� �������.
��� ��������� �� ��� ������� � ��������?
*/
DOMAINS

    ������������                        = ������������( ������, �����_������������, ���������� )
    ������                             = ������( ���, ����, �����_��_������ )
    ����������                          = ����; ������
    ����                                = �������; ��_�������
    ���                                 = �����; �����; ����; �����
    �����_������������, �����_��_������ = integer
    ������_������������                 = ������������*

    �������                             = �������( ���, ���� )
    ������_�������                      = �������*

PREDICATES

    nondeterm ���������_���                   (���)
    nondeterm ���������_����                  (����)
    nondeterm ���������_�����_������������    (�����_������������)
    nondeterm ����������_�������������_�����  (����, ����, ����, ����)

    nondeterm �����                           (���, ������_������������, ������) - (i,i,o)
    nondeterm ��������                        (������������, ������_������������)
    nondeterm �������                         (������������, ������_������������)
    
    nondeterm ���������_�������               (�������)

    nondeterm �����                           (�������, ������_�������)
    nondeterm �����_���������                 (������_�������, �������) - (i,o)
    nondeterm �������_���_��������            (������_�������, ������_�������, ������_�������) - (i,i,o)
    nondeterm �����_�������                   (������_�������)

CLAUSES

% ��������� ���������

    ���������_���(�����).
    ���������_���(�����).
    ���������_���(����) .
    ���������_���(�����).

    ���������_����(�������).
    ���������_����(��_�������).

    ���������_�����_������������(1).
    ���������_�����_������������(2).
    ���������_�����_������������(3).

    ����������_�������������_�����( �, �, �, � )
    :-
        � = �������,
        � = ��_�������,
        � = ��_�������,
        � = ��_�������;

        � = ��_�������,
        � = �������,
        � = ��_�������,
        � = ��_�������;

        � = ��_�������,
        � = ��_�������,
        � = �������,
        � = ��_�������;

        � = ��_�������,
        � = ��_�������,
        � = ��_�������,
        � = �������
    .

    �����_���������( [ �������(���, ����) | �������_������ ], �������� )
    :-
        ���� = ��_�������,
        �����_���������( �������_������, �������� );
        ���� = �������,
        �������� = �������(���, ����)
    .

    �����
    (
        ���,
        [
            ������������( ������(_���, ����, ����������_�����), _, _ )
            |
            �������_������
        ],
        ������

    )
    :-
        not( ��� = _��� ),
        �����( ���, �������_������, ������ );
        ��� = _���,
        ������ = ������( _���, ����, ����������_����� )
    .

    �����( �������, [ ������ | _ ] )
    :-
        ������� = ������
    .
    �����( �������, [ ������ | ��������� ] )
    :-
        not( ������� = ������ ),
        �����( �������, ��������� )
    .

    �������_���_��������( [], ����������, ����������������� )
    :-
        ����������������� = ����������
    .
    �������_���_��������( [ ������������� | ����������������� ], ����������, ����������������� )
    :-
        �����( �������������, ���������� ), 
        �������_���_��������( �����������������, ����������, ����������������� )
    .
    �������_���_��������( [ ������������� | ����������������� ], ����������, ����������������� )
    :-
        not( �����(�������������, ����������) ),
        �������_���_��������( �����������������, [ ������������� | ���������� ], ����������������� )
    .

% �������� ������������ �����
    ��������( ������������(������, �����_������������, ����������), ������_������������ )
    :-
        ���������� = ������,
        �������( ������������(������, �����_������������, ����������), ������_������������ );

        ���������� = ����,
        not(�������( ������������(������, �����_������������, ����������), ������_������������ ))
    .

% �����.
% (1)  � �� ������������ ������� � ��������.
    �������( ������������(������(�����, ����_�����, _), 1, _), _ )
    :-
        ����_����� = ��_�������
    .
% (2)  ����� � ����� � �����, ��� ��� ��� �����.
    �������( ������������(������(�����, _, �����_�����), 2, _), ������ )
    :-
        �����( �����, ������, ����� ),
        ����� = ������(_, _, �����_�����),
        �����_����� < �����_�����
    .
% (3)  ����� ����� � ����� ����� ����.
    �������( ������������(������(�����, _, �����_�����), 3, _), ������ )
    :-
        �����( �����, ������, ����� ),
        ����� = ������(_, _, �����_�����),
        �����_����� > �����_�����
    .

% �����.
% (4)  � �� ����������� ������� � ��������.
    �������( ������������(������(�����, ����_�����, _), 1, _), _ )
    :-
        ����_����� = ��_�������
    .
% (5)  ����� � ����� � �����, ��� ��� ���� �����.
    �������( ������������(������(�����, _, �����_�����), 2, _), ������ )
    :-
        �����( �����, ������, ����� ),
        ����� = ������(_, _, �����_�����),
        �����_����� < �����_�����
    .
% (6)  ����� ����� � ����� ����� ����.
    �������( ������������(������(�����, _, _), 3, _), ������ )
    :-
        �����( �����, ������, ����� ),
        ����� = ������(_, _, �����_�����),
        �����_����� = 4
    .

% ����.
% (7)  ��� �� � ������� �������.
    �������( ������������(������(����, ����_����, _), 1, _), _ )
    :-
        ����_���� = ��_�������
    .
% (8)  � ����� � ����� ����.
    �������( ������������(������(����, _, _), 2, _), ������ )
    :-
        �����( �����, ������, ����� ),
        ����� = ������(_, _, �����_�����),
        �����( �����, ������, ����� ),
        ����� = ������(_, _, �����_�����),
        not( �����_����� = 4 ),
        not( �����_����� = 4 )
    .
% (9)  ����� � ����� � �����, ��� ��� ��������� �����.
    �������( ������������(������(����, _, �����_����), 3, _), ������)
    :-
        �����( �����, ������, ����� ),
        ����� = ������(_, _, �����_�����),
        �����_����� < �����_����
    .

% �����.
% (10) ��� �� � ��������� ���� �� ���.
    �������( ������������(������(�����, ����_�����, _), 1, _), _ )
    :-
        ����_����� = ��_�������
    .
% (11) ����� � � ��������� ��� ������� �� �����, ��� �������� ������� ������.
    �������( ������������(������(�����, ����_�����, _), 2, _), _ )
    :-
        ����_����� = ��_�������
    .
% (12) ����� ����� � ����� �� ����.
    �������( ������������(������(�����, _, �����_�����), 3, _), ������ )
    :-
        �����( �����, ������, ����� ),
        ����� = ������(_, _, �����_�����),
        �����_����� < �����_�����
    .


% ��������� � �������� �������
    ���������_�������( �������� )
    :-
% ��������� ��������
        ���������_���( ���������_���1 ),
        ���������_���( ���������_���2 ),
        ���������_���( ���������_���3 ),
        ���������_���( ���������_���4 ),
        not( ���������_���1 = ���������_���2 ),
        not( ���������_���1 = ���������_���3 ),
        not( ���������_���1 = ���������_���4 ),
        not( ���������_���2 = ���������_���3 ),
        not( ���������_���2 = ���������_���4 ),
        not( ���������_���3 = ���������_���4 ),
        ���������_�����_������������( N11 ),
        ���������_�����_������������( N12 ),
        ���������_�����_������������( N13 ),
        not( N11 = N12 ),
        not( N11 = N13 ),
        not( N12 = N13 ),
        ���������_�����_������������( N21 ),
        ���������_�����_������������( N22 ),
        ���������_�����_������������( N23 ),
        not( N21 = N22 ),
        not( N21 = N23 ),
        not( N22 = N23 ),
        ���������_�����_������������( N31 ),
        ���������_�����_������������( N32 ),
        ���������_�����_������������( N33 ),
        not( N31 = N32 ),
        not( N31 = N33 ),
        not( N32 = N33 ),
        ���������_����( ����1 ),
        ���������_����( ����2 ),
        ���������_����( ����3 ),
        ���������_����( ����4 ),
        ����������_�������������_�����( ����1, ����2, ����3, ����4 ),

        H11 = ������������(������( ���������_���1, ����1, 1 ), N11, ������),
        H12 = ������������(������( ���������_���1, ����1, 1 ), N12, ������),
        H13 = ������������(������( ���������_���1, ����1, 1 ), N13, ����  ),

        H21 = ������������(������( ���������_���2, ����2, 2 ), N21, ������),
        H22 = ������������(������( ���������_���2, ����2, 2 ), N22, ������),
        H23 = ������������(������( ���������_���2, ����2, 2 ), N23, ����  ),

        H31 = ������������(������( ���������_���3, ����3, 3 ), N31, ������),
        H32 = ������������(������( ���������_���3, ����3, 3 ), N32, ������),
        H33 = ������������(������( ���������_���3, ����3, 3 ), N33, ����  ),

        H41 = ������������(������( ���������_���4, ����4, 4 ),   1, ������),
        H42 = ������������(������( ���������_���4, ����4, 4 ),   2, ������),
        H43 = ������������(������( ���������_���4, ����4, 4 ),   3, ������),

        ������_������������ = [ H11, H12, H13, H21, H22, H23, H31, H32, H33, H41, H42, H43 ],

% �������� ��������
        ��������( H11, ������_������������ ),
        ��������( H12, ������_������������ ),
        ��������( H13, ������_������������ ),
        ��������( H21, ������_������������ ),
        ��������( H22, ������_������������ ),
        ��������( H23, ������_������������ ),
        ��������( H31, ������_������������ ),
        ��������( H32, ������_������������ ),
        ��������( H33, ������_������������ ),
        ��������( H41, ������_������������ ),
        ��������( H42, ������_������������ ),
        ��������( H43, ������_������������ ),

% �������� ���������, � ��� �������� ��������
        ������_����� =
        [
            �������( ���������_���1, ����1 ),
            �������( ���������_���2, ����2 ),
            �������( ���������_���3, ����3 ),
            �������( ���������_���4, ����4 )
        ],
        �����_���������( ������_�����, �������� )
    .

    �����_�������( ������_������� )
    :-
        findall
        (
            _�������,
            ���������_�������( _������� ),
            �������
        ),
        �������_���_��������( �������, [], ������_������� )
    .

GOAL
    �����_�������( ������_������� ).
