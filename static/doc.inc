<H3>Documentation</H3>

<p>
QPLIB consists of quadratic optimization problems of the form
\[
\begin{align*}
 \textrm{sense} \;\;
 & \frac{1}{2} x^\top Q^0 x + b^0 x + q^0 \\
 \textrm{such that}\;\;
 & c^i_l \leq \frac{1}{2} x^\top Q^i x + b^i x \leq c^i_u & i \in \mathcal{M} \\
 %
 & l_j \leq x_j \leq u_j & j \in \mathcal{N}  \\
 %
 & x_j \in \mathbb{Z} & j \in \mathcal{Z}
\end{align*}
\]

where
<UL>
  <LI>\(\mathcal{N} = \{ 1, \ldots, n \}\) is the set of (indices) of variables,</LI>
  <LI>\(\mathcal{M} = \{ 1, \ldots, m \}\) is the set of (indices) of constraints,</LI>
  <LI>\(x = [x_j]_{j = 1}^n \in \mathbb{R}^n\) is a finite vector of variables,</LI>
  <LI>\(\textrm{sense}\in\{\min,\max\}\) is the objective sense,</LI>
  <LI>\(Q^i\in\mathbb{R}^{n\times n}\) for \(i \in \{ 0 \} \cup \mathcal{M}\) are lower-left triangle<sup title="In the QPLIB paper, the Q matrices were assumed to be symmetric. For this page, it is easier to assume them as triangle matrices.">(i)</sup> (\(Q^i_{row,col}=0\) for \(row < col\)) matrices holding the coefficients of quadratic terms,</LI>
  <LI>\(b^i\in\mathbb{R}^n\) for \(i \in \{0\}\cup\mathcal{M}\) are vectors holding the coefficients of linear terms,</LI>
  <LI>\(q^0\in\mathbb{R}\) is the constant term in the objective,</LI>
  <LI>\(c_l^i\in\mathbb{R}\cup\{-\infty\}, c_u^i\in\mathbb{R}\cup\{+\infty\}\), \(c_l^i\leq c_u^i\), for \(i \in \mathcal{M}\) are the left- and right-hand side, respectively, of each constraint,</LI>
  <LI>\(l_j\in\mathbb{R}\cup\{-\infty\}, u_j\in\mathbb{R}\cup\{+\infty\}\), \(l_j\leq u_j\), for \(j \in \mathcal{N}\) are the lower and upper bounds, respectively, on each variable \(x_j\),</LI>
  <LI>\(\mathcal{Z} \subseteq \mathcal{N}\) are the variables restricted to only attain integer values.</LI>
</UL>
</p>

<p>
Further, let
<UL>
  <LI>\(\mathcal{B} := \{j\in\mathcal{Z} \,:\, \{l_j,u_j\}=\{0,1\}\}\) be the set of binary variables,</LI>
  <LI>\(\mathcal{N}^Q := \{j\in\mathcal{N} \,:\, \exists i\in\mathcal{M}\cup\{0\}, k\in\mathcal{N} : Q^i_{j,k}+Q^i_{k,j} \neq 0\}\) be the set of nonlinear variables (that is, variables appearing in at least one quadratic term),</LI>
  <LI>\(\mathcal{L} := \{i\in\mathcal\{M\} \,:\, Q^i = 0\}\) be the set of linear constraints,</LI>
  <LI>\(\mathcal{Q} := \mathcal{M} \setminus \mathcal{L}\) be the set of (truely) quadratic constraints, and</LI>
  <LI>\(P := \{P_k\}_{k\in\mathcal{P}}\), \(\mathcal{P} := \{1,\ldots,p\}\), be the finest partitioning of \(\mathcal{N}^Q\) (i.e., \(P_k\subseteq\mathcal{N}^Q, P_k \cap P_k' = \emptyset, k,k'\in\mathcal{P}, k\neq k'\)),
      such that \(\forall i\in\mathcal{Q}\cup\{0\}\; \forall j,k\in\mathcal{N}^Q, Q_{j,k}^i \neq 0\; \exists p\in\mathcal{P} : j,k\in P_p\).
      That is, \(P\) describes the block structure of the Hessian of the Lagrangian.
   </LI>
</UL>
</p>
<p>
Additionally, one solution point \(x^* \in \mathbb{R}^n\) might be available for each instance.
</p>

<p>
For each instance, we collect the following information:
<p>

<TABLE cellpadding="10px" style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse;" border="0" style="vertical-align:top;">
<THEAD>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TH>Identifier</TH>
  <TH>Meaning</TH>
  <TH>Definition</TH>
 </TR>
</THEAD>
<TBODY>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="probtype"></A>PROBTYPE</TD>
  <TD>Problem Type</TD>
  <TD><B>OVC</B>, where <B>O</B> is<BR/>
   <table>
    <TR border="0" style="vertical-align:top;"><TD>&ndash;&nbsp;<B>L</B>,</TD><TD>if \(Q^0=0\), else</TD></TR>
    <TR border="0" style="vertical-align:top;"><TD>&ndash;&nbsp;<B>D</B>,</TD><TD>if \(Q^0\succeq 0, \textrm{sense}=\min, Q^0 = {Q^0}^\top\), else</TD></TR>
    <TR border="0" style="vertical-align:top;"><TD>&ndash;&nbsp;<B>D</B>,</TD><TD>if \(Q^0\preceq 0, \textrm{sense}=\max, Q^0 = {Q^0}^\top\), else</TD></TR>
    <TR border="0" style="vertical-align:top;"><TD>&ndash;&nbsp;<B>C</B>,</TD><TD>if \(Q^0\succeq 0, \textrm{sense}=\min\), else</TD></TR>
    <TR border="0" style="vertical-align:top;"><TD>&ndash;&nbsp;<B>C</B>,</TD><TD>if \(Q^0\preceq 0, \textrm{sense}=\max\), else</TD></TR>
    <TR border="0" style="vertical-align:top;"><TD>&ndash;&nbsp;<B>Q</B>;</TD></TR>
   </table><BR/>
   <B>V</B> is
   <table>
    <TR border="0" style="vertical-align:top;"><TD>&ndash;&nbsp;<B>C</B>,</TD><TD>if \(\mathcal{Z} = \emptyset\), else</TD></TR>
    <TR border="0" style="vertical-align:top;"><TD>&ndash;&nbsp;<B>B</B>,</TD><TD>if \(\mathcal{N} = \mathcal{B}\), else</TD></TR>
    <TR border="0" style="vertical-align:top;"><TD>&ndash;&nbsp;<B>M</B>,</TD><TD>if \(\mathcal{Z} \setminus \mathcal{B} = \emptyset\), else</TD></TR>
    <TR border="0" style="vertical-align:top;"><TD>&ndash;&nbsp;<B>I</B>,</TD><TD>if \(\mathcal{N} = \mathcal{Z}\), else</TD></TR>
    <TR border="0" style="vertical-align:top;"><TD>&ndash;&nbsp;<B>G</B>;</TD></TR>
   </table><BR/>
   <B>C</B> is
   <table>
    <TR border="0" style="vertical-align:top;"><TD>&ndash;&nbsp;<B>N</B>,</TD><TD>if \(\mathcal{M} = \emptyset\), \(l_j=-\infty, u_j=+\infty, j\in\mathcal{N}\setminus\mathcal{B}\), else</TD></TR>
    <TR border="0" style="vertical-align:top;"><TD>&ndash;&nbsp;<B>B</B>,</TD><TD>if \(\mathcal{M} = \emptyset\), else</TD></TR>
    <TR border="0" style="vertical-align:top;"><TD>&ndash;&nbsp;<B>L</B>,</TD><TD>if \(\mathcal{Q} = \emptyset\), else</TD></TR>
    <TR border="0" style="vertical-align:top;"><TD>&ndash;&nbsp;<B>D</B>,</TD><TD>if \(\forall i\in\mathcal{Q}: Q^i\succeq 0 \textrm{ if } c_l^i\neq-\infty\) and \(Q^i\preceq 0 \textrm{ if } c_u^i\neq+\infty\) and \(Q^i={Q^i}^\top\), else</TD></TR>
    <TR border="0" style="vertical-align:top;"><TD>&ndash;&nbsp;<B>C</B>,</TD><TD>if \(\forall i\in\mathcal{Q}: Q^i\succeq 0 \textrm{ if } c_l^i\neq-\infty\) and \(Q^i\preceq 0 \textrm{ if } c_u^i\neq+\infty\), else</TD></TR>
    <TR border="0" style="vertical-align:top;"><TD>&ndash;&nbsp;<B>Q</B>.</TD></TR>
   </table>
  </TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="solobjvalue"></A>SOLOBJVALUE</TD>
  <TD>Solution point objective value</TD>
  <TD>\(\frac{1}{2} (x^*)^\top Q^0 x^* + b^0 x^* + q^0\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="solinfeasibility"></A>SOLINFEASIBILITY</TD>
  <TD>Solution point infeasibility</TD>
  <TD>The maximum of <UL>
     <LI>\( \max\{c_l^i - \frac{1}{2}(x^*)^\top Q^i x^* - b^i x^*,  \frac{1}{2}(x^*)^\top Q^i x^* + b^i x^* - c_u^i\}, i\in\mathcal{M} \),</LI>
     <LI>\( \max\{l_j - x_j^*, x_j^* - u_j\}, j\in\mathcal{N} \),</LI>
     <LI>\( |x_j^* - \text{round} (x_j^*)|, j\in\mathcal{Z} \), and</LI>
     <LI>0.</LI>
    </UL></TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="donor"></A>DONOR</TD>
  <TD>Donor of instance.</TD>
  <TD>Name of person who submitted this instance to QPLIB.</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nvars"></A>NVARS</TD>
  <TD>Number of Variables</TD>
  <TD>\(|\mathcal{N}|\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="ncons"></A>NCONS</TD>
  <TD>Number of Constraints</TD>
  <TD>\(|\mathcal{M}|\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nbinvars"></A>NBINVARS</TD>
  <TD>Number of Binary Variables</TD>
  <TD>\(|\mathcal{B}|\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nintvars"></A>NINTVARS</TD>
  <TD>Number of (General) Integer Variables</TD>
  <TD>\(|\mathcal{Z} \setminus \mathcal{B}|\)</TD>
 </TR>
 <!--   'nsemi' : int, -->
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nnlvars"></A>NNLVARS</TD>
  <TD>Number of Nonlinear Variables</TD>
  <TD>\(|\mathcal{N}^Q|\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nnlbinvars"></A>NNLBINVARS</TD>
  <TD>Number of Nonlinear Binary Variables</TD>
  <TD>\(|\mathcal{N}^Q\cap\mathcal{B}|\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nnlbinvars"></A>NNLINTVARS</TD>
  <TD>Number of Nonlinear Integer Variables</TD>
  <TD>\(|\mathcal{N}^Q\cap\mathcal{Z}|\)</TD>
 </TR>
 <!--   'nnlsemi' : int, -->
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nboundedvars"></A>NBOUNDEDVARS</TD>
  <TD>Number of Bounded Non-Binary Variables</TD>
  <TD>\(|\{j\in \mathcal{N}\setminus\mathcal{B} : l_j \neq -\infty, u_j \neq \infty\}|\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nsingleboundedvars"></A>NSINGLEBOUNDEDVARS</TD>
  <TD>Number of Variables with only one bound</TD>
  <TD>\(|\{j\in \mathcal{N} : \textrm{either}\; l_j = -\infty \;\textrm{or}\; u_j = \infty\}|\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
 <!--   'nsos1' : int, -->
 <!--   'nsos2' : int, -->
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="objsense"></A>OBJSENSE</TD>
  <TD>Objective sense</TD>
  <TD>\(\textrm{sense}\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="objtype"></A>OBJTYPE</TD>
  <TD>Objective type</TD>
  <TD><B>linear</B> if \(Q^0=0\)<BR/>
      <B>quadratic</B> if \(Q^0\neq 0\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nlincons"></A>NLINCONS</TD>
  <TD>Number of linear constraints</TD>
  <TD>\(|\mathcal{L}|\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nquadcons"></A>NQUADCONS</TD>
  <TD>Number of quadratic constraints</TD>
  <TD>\(|\mathcal{Q}|\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="ndiagquadcons"></A>NDIAGQUADCONS</TD>
  <TD>Number of diagonal quadratic constraints</TD>
  <TD>\(|\{i\in\mathcal{Q} : \forall j,k\in\mathcal{N},j\neq k: Q^i_{j,k} = 0\}|\)</TD>
 </TR>
  <!--  'npolynomcons' : int, -->
  <!--  'nsignomcons' : int, -->
  <!--  'ngennlcons' : int, -->
  <!--  'nloperands' : lambda x: set(x.split()), -->
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nobjnz"></A>NOBJNZ</TD>
  <TD>Number of nonzeros in objective</TD>
  <TD>\(|\{j\in\mathcal{N} \,:\, b^0_j\neq 0 \;\textrm{or}\; \exists k\in\mathcal{N} : Q^0_{j,k}+Q^0_{k,j} \neq 0\}|\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nobjnlnz"></A>NOBJNLNZ</TD>
  <TD>Number of nonlinear nonzeros in objective</TD>
  <TD>\(|\{j\in\mathcal{N} \,:\, \exists k\in\mathcal{N} : Q^0_{j,k}+Q^0_{k,j} \neq 0\}|\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nobjquadnz"></A>NOBJQUADNZ</TD>
  <TD>Number of quadratic terms in objective</TD>
  <TD>\(|\{(j,k)\in\mathcal{N}\times\mathcal{N} \,:\, Q^0_{j,k}\neq 0\}|\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nobjquaddiagnz"></A>NOBJQUADDIAGNZ</TD>
  <TD>Number of square terms in objective</TD>
  <TD>\(|\{j\in\mathcal{N} \,:\, Q^0_{j,j}\neq 0\}|\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="objquaddensity"></A>OBJQUADDENSITY</TD>
  <TD>Density of \(Q^0\)</TD>
  <TD>\(\frac{2\times\textrm{NOBJQUADNZ}-\textrm{NOBJQUADDIAGNZ}}{\textrm{NOBJNLNZ}^2}\), if \(Q^0\neq 0\), otherwise 0</TD>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="njacobiannz"></A>NJACOBIANNZ</TD>
  <TD>Number of nonzeros in Jacobian</TD>
  <TD>\(\sum_{i\in\mathcal{M}} |\{j\in\mathcal{N} \,:\, b^i_j\neq 0 \;\textrm{or}\; \exists k\in\mathcal{N} : Q^i_{j,k}+Q^i_{k,j} \neq 0\}|\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="njacobiannlnz"></A>NJACOBIANNLNZ</TD>
  <TD>Number of nonlinear nonzeros in Jacobian</TD>
  <TD>\(\sum_{i\in\mathcal{M}} |\{j\in\mathcal{N} \,:\, \exists k\in\mathcal{N} : Q^i_{j,k}+Q^i_{k,j} \neq 0\}|\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nz"></A>NZ</TD>
  <TD>Number of nonzeros in Objective Gradient and Jacobian</TD>
  <TD>\(\textrm{NOBJNZ} + \textrm{NJACOBIANNZ}\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nlnz"></A>NLNZ</TD>
  <TD>Number of nonlinear nonzeros in Objective Gradient and Jacobian</TD>
  <TD>\(\textrm{NOBJNLNZ} + \textrm{NJACOBIANNLNZ}\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nlaghessiannz"></A>NLAGHESSIANNZ</TD>
  <TD>Number of nonzeros in Hessian of Lagrangian</TD>
  <TD>\(|\{(j,k)\in\mathcal{N}\times\mathcal{N} \,:\, \exists i\in\mathcal{M}\cup\{0\} : Q^i_{j,k}\neq 0\}|\)
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nlaghessiandiagnz"></A>NLAGHESSIANDIAGNZ</TD>
  <TD>Number of nonzeros in diagonal of Hessian of Lagrangian</TD>
  <TD>\(|\{j\in\mathcal{N} \,:\, \exists i\in\mathcal{M}\cup\{0\} : Q^i_{j,j}\neq 0\}|\)
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="objcurvature"></A>OBJCURVATURE</TD>
  <TD>Convexity/Concavity of objective function</TD>
  <TD><B>linear</B>, if \(Q^0=0\), else<BR/>
      <B>convex</B>, if \(Q^0\succeq 0\), else<BR/>
      <B>concave</B>, if \(Q^0\preceq 0\), else<BR/>
      <B>indefinite</B>.
  </TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nobjquadnegev"></A>NOBJQUADNEGEV</TD>
  <TD>Number of negative eigenvalues in \(Q^0\)</TD>
  <TD>\(|\{\lambda \leq -10^{-12} \,:\, \exists v\neq 0 : Q^0v = \lambda v\}|\)
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nobjquadnegev"></A>NOBJQUADPOSEV</TD>
  <TD>Number of positive eigenvalues in \(Q^0\)</TD>
  <TD>\(|\{\lambda \geq 10^{-12} \,:\, \exists v\neq 0 : Q^0v = \lambda v\}|\)
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="objquadhardevfrac"></A>OBJQUADHARDEVFRAC</TD>
  <TD>Fraction of hard eigenvalues of \(Q^0\)</TD>
  <TD>\(\frac{\textrm{NOBJQUADNEGEV}}{|\mathcal{N}|}\), if \(\textrm{sense}=\min\);<BR/>
      \(\frac{\textrm{NOBJQUADPOSEV}}{|\mathcal{N}|}\), if \(\textrm{sense}=\max\)
  </TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="conscurvature"></A>CONSCURVATURE</TD>
  <TD>Convexity/Concavity of constraints</TD>
  <TD><table>
     <TR border="0" style="vertical-align:top;"><TD><B>linear</B>,</TD><TD>if \(\mathcal{L}=\mathcal{M}\), else</TD></TR>
     <TR border="0" style="vertical-align:top;"><TD><B>convex</B>,</TD><TD>if \(\forall i\in\mathcal{Q}, c_u^i\neq+\infty: Q^i\succeq 0\) and \(\forall i\in\mathcal{Q}, c_l^i\neq-\infty: Q^i\preceq 0\), else</TD></TR>
     <TR border="0" style="vertical-align:top;"><TD><B>concave</B>,</TD><TD>if \(\forall i\in\mathcal{Q}, c_u^i\neq+\infty: Q^i\preceq 0\) and \(\forall i\in\mathcal{Q}, c_l^i\neq-\infty: Q^i\succeq 0\), else</TD></TR>
     <TR border="0" style="vertical-align:top;"><TD><B>indefinite</B>.</TD></TR>
    </table>
  </TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="convex"></A>CONVEX</TD>
  <TD>Convexity of continuous relaxation</TD>
  <TD><table>
     <TR border="0" style="vertical-align:top;"><TD><B>True</B>,</TD><TD>if \(\textrm{CONSCURVATURE}\) = <B>convex</B> and \(\textrm{OBJCURVATURE}\) = <B>convex</B>, and \(\textrm{sense}=\min\), else</TD></TR>
     <TR border="0" style="vertical-align:top;"><TD><B>True</B>,</TD><TD>if \(\textrm{CONSCURVATURE}\) = <B>convex</B> and \(\textrm{OBJCURVATURE}\) = <B>concave</B>, and \(\textrm{sense}=\max\), else</TD></TR>
     <TR border="0" style="vertical-align:top;"><TD><B>False</B>.</TD></TR>
    </table>
  </TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nconvexnlcons"></A>NCONVEXNLCONS</TD>
  <TD>Number of convex nonlinear constraints</TD>
  <TD>\(|\{i\in\mathcal{Q} \;:\; Q^i\succeq 0 \textrm{ if } c_u^i\neq+\infty \textrm{ and } Q^i\preceq 0 \textrm{ if }  c_l^i\neq-\infty\}|\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nconcavenlcons"></A>NCONCAVENLCONS</TD>
  <TD>Number of concave nonlinear constraints</TD>
  <TD>\(|\{i\in\mathcal{Q} \;:\; Q^i\preceq 0 \textrm{ if } c_u^i\neq+\infty \textrm{ and } Q^i\succeq 0 \textrm{ if }  c_l^i\neq-\infty\}|\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nindefinitenlcons"></A>NINDEFINITENLCONS</TD>
  <TD>Number of indefinite nonlinear constraints</TD>
  <TD>\(|\{i\in\mathcal{Q} \;:\; Q^i\not\succeq 0 \textrm{ and } Q^i\not\preceq 0 \}|\)</TD>
 </TR>
 <!--
    'minobjcoef' : float,
    'minobjcoefvar' : str,
    'maxobjcoef' : float,
    'maxobjcoefvar' : str,
    'minjaccoef' : float,
    'minjaccoefvar' : str,
    'minjaccoefequ' : str,
    'maxjaccoef' : float,
    'maxjaccoefvar' : str,
    'maxjaccoefequ' : str,
    'minscale' : float,
    'minscalevar' : str,
    'minscaleequ' : str,
    'maxscale' : float,
    'maxscalevar' : str,
    'maxscaleequ' : str,
 -->
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="nlaghessianblocks"></A>NLAGHESSIANBLOCKS</TD>
  <TD>Number of blocks in Hessian of Lagrangian</TD>
  <TD>\(|\mathcal{P}|\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="laghessianminblocksize"></A>LAGHESSIANMINBLOCKSIZE</TD>
  <TD>Minimal blocksize in Hessian of Lagrangian</TD>
  <TD>\(\min\{|P_k| \;:\; k\in\mathcal{P}\}\) </TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="laghessianmaxblocksize"></A>LAGHESSIANMAXBLOCKSIZE</TD>
  <TD>Maximal blocksize in Hessian of Lagrangian</TD>
  <TD>\(\max\{|P_k| \;:\; k\in\mathcal{P}\}\)</TD>
 </TR>
 <TR style="border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse; vertical-align:top;">
  <TD><A name="laghessianavgblocksize"></A>LAGHESSIANAVGBLOCKSIZE</TD>
  <TD>Average blocksize in Hessian of Lagrangian</TD>
  <TD>\(\frac{1}{|\mathcal{P}|}\sum_{k\in\mathcal{P}} |P_k|\)</TD>
 </TR>
</TBODY>
</TABLE>
