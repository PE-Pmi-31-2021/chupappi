   M S B A M L   `   `   `  ����  	cryptoeye    cryptoeye.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	     � Title$  	CryptoEye��5   	   $	��720��6   $
��1024��6(    � 
ResizeMode$ NoResize=�5   	   .��5	      �� ���#E5E5E5._�5
   
   � -   5         �Name$
 Grid��5
       � ColumnDefinitions 5      �� 5      �� 5      �� 5       � RowDefinitions 5      �� 5      $��50 �6    �� 5      �� 5      �� 5      .+�5      �� ���#4F4F4F$��3��6-   $��50��6A   $
��1024��6M   � 5      $
��1024��6   $��50��6$    5      �� 5      $��150px �6+   �� 5      �� 5      $��250px �6+   .+�5      �� $��Center=�6   $��Center=�69   $
��16px(�6T   $
��Bold"�6d   
�������.��5    /   👁 CryptoEye5"      �� 5$      $��1��6    �� CornerRadius$ 5��6-   $��1q�6>   ���#F2F2F2���#2D9CDB$��25��5%   3   ._�5&      �� -   5         ��Name$ SearchTermTextBox��5'   "   ���#F2F2F2$	��5 0q�5&   7   $��Center=�6D   $��0q�5(   "   5)      �� 5*      $��1��6     J� IsHitTestVisible .   �� Padding$ 5 0 0 0q�6I   $��  Search ...��6[   $��Center=�5+       $
��Left=�6;   ���#828282��5,      �� 5-      	 �� 
TargetType"	 ��6$   .�5.   "   �� 
 �� Property
 � y� �� Value$ 	Collapsed=�6?    �� Triggers 5/   "   �� 50   &    �� Binding 62   �� *Text+ �� ElementName$ SearchTermTextBox�� �� Value  6j   .a�51   *   �� 
 � y�$ Visible=�6G   52   '   54      56      �� 57      $��2��6    $��Center=�60    �� TextAlignment$ Center=�6K   �� 58      -   5         ��Name$ Label��59       ���#FFFFFF$
��16px(�5:       .��60   user@gmail.com5<       �� 5=      $ 50��6!   $��32��63   $��32��6?   $��5 0 0 0q�6J   ��5>      �� 5?   "    j� Stretch$
 Fill=�6-    �� ImageSource$ assets/gorilla.png��6<   5A      5B      5C      5D      5E      5F      5G      