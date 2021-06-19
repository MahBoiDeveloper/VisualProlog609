/*��� ���������� �� ����� �������� ��������� �� ����� ���������.
��� ���� ��� ������� ��������� ������.
����. ������� �� ����� �����, ����� ���� ���� � ����������� � ������. �������, �� ����� ����.
���. �� ����� ��������, � ����� ���� ����� � ����� ����������� �����.
����. ������� �� ����� �����, ����� ���� ����� � ���������� ������. � �������� �� ������� ������ ����.
(��������. ���, ��� ������� ���� �� �����������,� ��������, ������ ������ ���� ���� ������ ������, � ������ � ������ ������� �� ����.)
�����������, ������ �� ���� �������������� ���������, ����������, ��� ������ �� ������ �������, � ������� ��� ����?*/
DOMAINS
    ���, ���, �������, ���������� = symbol
    ���������� = integer
    
    ����� = �����(�������, ���)
    ������_����=�����*
    ������_���������� = ����������*
    ������_������� = ������_����������*
PREDICATES 
    nondeterm ������_�(�����, ������_����)
    nondeterm ������_�(������_����������, ������_�������)
    nondeterm �����_��_������(����������, ����������, ������_����������)

    nondeterm ���������_�����(�����)
    nondeterm ���������_����������(����������)
    nondeterm ���������_������_����������(����������, ������_����������)

    nondeterm �������_����������_������������_�������(������_����������, ����������, ����������)
    nondeterm ��������_����������_������_�������(������_�������)

    nondeterm �������(���, ����������, ������_����)
    nondeterm ���������_������(���, ����������, ������_����, ������_����������) 
    nondeterm ���������_���_������(���, ����������, ������_����, ������_����������)
    
    nondeterm ���������_��������(������_����)
    nondeterm �����_������(���)
    
CLAUSES
%============================================================================================================
%--------------------------���������������-���������---------------------------------------------------------
%============================================================================================================
%   �������������� �������� ������
    ������_�(X,[X|_]).
    ������_�(X,[_|�����]):-������_�(X,�����).
%------------------------------------------------------------------------------------------------------------    
    % ����� � ������ �� ������
    �����_��_������(�����, X, [X|_]) :- ����� - 1 = 0.
    �����_��_������(�����, X, [_|�����]) :- �����_1 = ����� - 1,
                                            �����_��_������(�����_1, X, �����).
%------------------------------------------------------------------------------------------------------------   
    �������_����������_������������_�������([], _, 0).
    �������_����������_������������_�������([������|�����_������], ����������, ����������):-

	                        �������_����������_������������_�������(�����_������, ����������, ����������_1),
	                        ������ = ����������,
	                        ���������� = ����������_1 + 1.

    �������_����������_������������_�������([������|�����_������], ����������, ����������):-

	                        �������_����������_������������_�������(�����_������, ����������, ����������_1),
	                        not(������ = ����������),
	                        ���������� = ����������_1.
%============================================================================================================
%------------------------------------------------------------------------------------------------------------ 
    ���������_�����(�����(�������_�����, �����)).
    ���������_�����(�����(�������_�����, ��������)).
%-------------------------------------------------------------
    ���������_�����(�����(�����_����, ����_�_�����������)).
    ���������_�����(�����(�����_����, �����)).
%-------------------------------------------------------------
    ���������_�����(�����(������, �����)).
    ���������_�����(�����(������, ����������_������)).
%-------------------------------------------------------------
    ���������_�����(�����(�����, ����)).
%------------------------------------------------------------------------------------------------------------ 
    ���������_����������(�������).
    ���������_����������(�����).
%------------------------------------------------------------------------------------------------------------
    ���������_������_����������(0, []).
    ���������_������_����������(����������, ������) :- not(���������� = 0),
                                                       ����������_1 = ���������� - 1,
                                                       ���������_������_����������(����������_1, ������_1),
                                                       ���������_����������(����������),
                                                       ������ = [���������� | ������_1].
%------------------------------------------------------------------------------------------------------------
    ��������_����������_������_�������(������_�����������) :-

                                                 ������_�(������_1, ������_�����������),
                                                 ������_�(������_2, ������_�����������),
                                                 ������_�(������_3, ������_�����������),
                                                 not(������_1 = ������_2), not(������_1 = ������_3), not(������_2 = ������_3),
                                                 % ���, ��� ������� ���� �� �����������,� ��������,...
                                                 �������_����������_������������_�������(������_1, �������, 0),
                                                 % ...������ ������ ���� ���� ������ ������,...
                                                 �������_����������_������������_�������(������_2, �����, 1),
                                                 % ...� ������ � ������ ������� �� ����.
                                                 �������_����������_������������_�������(������_3, �����, 0).
%------------------------------------------------------------------------------------------------------------
    % ����
    % ������� �� ����� �����
    �������(����, 1, ������_����) :- ������_�(�����(�������_�����, �����), ������_����).
    % ����� ���� ���� � �����������
    �������(����, 2, ������_����) :- ������_�(�����(�����_����, ����_�_�����������), ������_����).
    % �������, �� ����� ����.
    �������(����, 3, ������_����) :- ������_�(�����(�����, ����), ������_����).

    % ���
    % �� ����� ��������
    �������(���, 1, ������_����) :- ������_�(�����(�������_�����, ��������), ������_����).
    % � ����� ���� �����
    �������(���, 2, ������_����) :- ������_�(�����(�����_����, �����), ������_����).
    % � ����� "���������� �����".
    �������(���, 3, ������_����) :- ������_�(�����(������, �����), ������_����).

    % ����
    % ������� �� ����� �����
    �������(����, 1, ������_����) :- ������_�(�����(�������_�����, �����), ������_����).
    % ����� ���� �����
    �������(����, 2, ������_����) :- ������_�(�����(�����_����, �����), ������_����).
    % � ���������� ������.
    �������(����, 3, ������_����) :- ������_�(�����(������, ����������_������), ������_����).
    % � �������� �� ������� ������ ����.
    �������(����, 4, ������_����) :- ������_�(�����(�����, ����), ������_����).
%------------------------------------------------------------------------------------------------------------
    % � ������ ��������� �������� � ������������ ������ � ���������� ���� ������
    ���������_������(���_����������, �����_������, ������_����, ������_����������_����������) :-

                                                   �������(���_����������, �����_������, ������_����),
                                                   �����_��_������(�����_������, �������, ������_����������_����������).

    ���������_������(���_����������, �����_������, ������_����, ������_����������_����������) :-

                                                   not(�������(���_����������, �����_������, ������_����)),
                                                   �����_��_������(�����_������, �����, ������_����������_����������).
%------------------------------------------------------------------------------------------------------------
    ���������_���_������(���_����������, 3, ������_����, ������_����������_����������):- 

                                           ���������_������(���_����������, 1, ������_����, ������_����������_����������),
                                           ���������_������(���_����������, 2, ������_����, ������_����������_����������),
                                           ���������_������(���_����������, 3, ������_����, ������_����������_����������).

    ���������_���_������(���_����������, 4, ������_����, ������_����������_����������):- 

                                           ���������_������(���_����������, 1, ������_����, ������_����������_����������),
                                           ���������_������(���_����������, 2, ������_����, ������_����������_����������),
                                           ���������_������(���_����������, 3, ������_����, ������_����������_����������),
                                           ���������_������(���_����������, 4, ������_����, ������_����������_����������).
%------------------------------------------------------------------------------------------------------------ 
% ���������� ��������, ��� �������� - ��� ������ �� �����������, �������� �������: ���, ������ ��������� �������
% � ������ ���������� ���� �������
    ���������_��������(�������) :-  ���������_������_����������(3, ����������_1),
                                    ���������_������_����������(3, ����������_2),
                                    ���������_������_����������(4, ����������_3),

                                    ������_����������� = [����������_1, ����������_2, ����������_3],
                                    ��������_����������_������_�������(������_�����������),

                                    ���������_�����(�����_1), �����_1 = �����(�������_�����, _),
                                    ���������_�����(�����_2), �����_2 = �����(�����_����, _),
                                    ���������_�����(�����_3), �����_3 = �����(������, _),
                                    ���������_�����(�����_4), �����_4 = �����(�����, _),

                                    ������� = [�����_1, �����_2, �����_3, �����_4],

                                    % ��������� ��������
                                    ���������_���_������(����, 3, �������, ����������_1),
                                    ���������_���_������(���,  3, �������, ����������_2),
                                    ���������_���_������(����, 4, �������, ����������_3).
%------------------------------------------------------------------------------------------------------------
    % ������� ������� �� ����������� �������
    �����_������(������) :- ���������_��������(�������),
                            ������_�(�����(������, ������), �������).

    
GOAL 
    �����_������(������).
    
    
    
    
    
    
