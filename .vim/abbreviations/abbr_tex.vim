iabbr ital \emph{!cursor!}<ESC>:call search('!cursor!','b')<CR>cf!
iabbr itl \emph{!cursor!}<ESC>:call search('!cursor!','b')<CR>cf!
iabbr bld \textbf{!cursor!}<ESC>:call search('!cursor!','b')<CR>cf!

iabbr quotep \begin{quotation}<CR>\emph<CR>!cursor!<CR>\end{quotation}<ESC>:call search('!cursor!','b')<CR>cf!
iabbr equp \begin{equation}<CR>!cursor!<CR>\end{equation}<ESC>:call search('!cursor!','b')<CR>cf!

iabbr lst \begin{itemize}<CR>\item!cursor!<CR>\end{itemize}<ESC>:call search('!cursor!','b')<CR>cf!
iabbr enu \begin{enumerate}<CR>\item!cursor!<CR>\end{enumerate}<ESC>:call search('!cursor!','b')<CR>cf!
iabbr des \begin{description}<CR>\item[!cursor!]<CR>\end{description}<ESC>:call search('!cursor!','b')<CR>cf!
iabbr itm \item
iabbr imt \item

iabbr ls1 \begin{itemize}<CR>\item<1->!cursor!<CR>\end{itemize}<ESC>:call search('!cursor!','b')<CR>cf!
iabbr ls2 \begin{itemize}<CR>\item<2->!cursor!<CR>\end{itemize}<ESC>:call search('!cursor!','b')<CR>cf!
iabbr it1 \item<1->
iabbr it2 \item<2->
iabbr it3 \item<3->
iabbr it4 \item<4->
iabbr it5 \item<5->

iabbr cap \chapter{!cursor!}<ESC>:call search('!cursor!','b')<CR>cf!
iabbr sect \section{!cursor!}<ESC>:call search('!cursor!','b')<CR>cf!
iabbr ssect \subsection{!cursor!}<ESC>:call search('!cursor!','b')<CR>cf!

iabbr frm \frame<CR>{<CR>\frametitle{!cursor!}<CR>}<ESC>:call search('!cursor!','b')<CR>cf!

iabbr fg \begin{figure}<CR>!cursor!<CR>\end{figure}<ESC>:call search('!cursor!','b')<CR>cf!
iabbr cntr \begin{center}<CR>!cursor!<CR>\end{center}<ESC>:call search('!cursor!','b')<CR>cf!
iabbr xfg \begin{figure}<CR>\centering<CR>\caption{!cursor!}<CR>\label{fig:XXX}<CR>\end{figure}<ESC>:call search('!cursor!','b')<CR>cf!
iabbr imag \includegraphics[scale=0.5]{!cursor!}<ESC>:call search('!cursor!','b')<CR>cf!
iabbr lbl \label{!cursor!}<ESC>:call search('!cursor!','b')<CR>cf!
iabbr rf \ref{!cursor!}<ESC>:call search('!cursor!','b')<CR>cf!

iabbr sfg \subfloat[!cursor!]<CR>{<CR>\label{fig:XXX}<CR>}<ESC>:call search('!cursor!','b')<CR>cf!
iabbr srf \ref{XXX}\subref{!cursor!}<ESC>:call search('!cursor!','b')<CR>cf!

iabbr ddef \newtheorem{definition}{Definición}
iabbr def \begin{definition}<CR>!cursor!<CR>\end{definition}<ESC>:call search('!cursor!','b')<CR>cf!

iabbr ftnt \footnote{!cursor!}<ESC>:call search('!cursor!','b')<CR>cf!

iabbr cit \cite{!cursor!}<ESC>:call search('!cursor!','b')<CR>cf!

iabbr () \left (!cursor! \right )<ESC>:call search('!cursor!','b')<CR>cf!
iabbr [] \left [!cursor! \right ]<ESC>:call search('!cursor!','b')<CR>cf!
iabbr {} \left \{!cursor! \right \}<ESC>:call search('!cursor!','b')<CR>cf!
iabbr vctr \mathbf{!cursor!}<ESC>:call search('!cursor!','b')<CR>cf!

iabbr ... \ldots

iabbr %%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%<CR>%% !cursor!<CR>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%<CR><ESC>:call search('!cursor!','b')<CR>cf!
