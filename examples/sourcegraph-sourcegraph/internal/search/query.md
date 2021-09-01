# Package query

## Index

* [Constants](#const)
    * [const AND](#AND)
    * [const And](#And)
    * [const Any](#Any)
    * [const BoolType](#BoolType)
    * [const Concat](#Concat)
    * [const DQUOTE](#DQUOTE)
    * [const FieldAfter](#FieldAfter)
    * [const FieldArchived](#FieldArchived)
    * [const FieldAuthor](#FieldAuthor)
    * [const FieldBefore](#FieldBefore)
    * [const FieldCase](#FieldCase)
    * [const FieldCombyRule](#FieldCombyRule)
    * [const FieldCommitter](#FieldCommitter)
    * [const FieldContent](#FieldContent)
    * [const FieldContext](#FieldContext)
    * [const FieldCount](#FieldCount)
    * [const FieldDefault](#FieldDefault)
    * [const FieldFile](#FieldFile)
    * [const FieldFork](#FieldFork)
    * [const FieldIndex](#FieldIndex)
    * [const FieldLang](#FieldLang)
    * [const FieldMessage](#FieldMessage)
    * [const FieldPatternType](#FieldPatternType)
    * [const FieldRepo](#FieldRepo)
    * [const FieldRepoGroup](#FieldRepoGroup)
    * [const FieldRepoHasCommitAfter](#FieldRepoHasCommitAfter)
    * [const FieldRepoHasFile](#FieldRepoHasFile)
    * [const FieldRev](#FieldRev)
    * [const FieldSelect](#FieldSelect)
    * [const FieldStable](#FieldStable)
    * [const FieldTimeout](#FieldTimeout)
    * [const FieldType](#FieldType)
    * [const FieldVisibility](#FieldVisibility)
    * [const HeuristicDanglingParens](#HeuristicDanglingParens)
    * [const HeuristicHoisted](#HeuristicHoisted)
    * [const HeuristicParensAsPatterns](#HeuristicParensAsPatterns)
    * [const Invalid](#Invalid)
    * [const IsPredicate](#IsPredicate)
    * [const LPAREN](#LPAREN)
    * [const Literal](#Literal)
    * [const NOT](#NOT)
    * [const No](#No)
    * [const None](#None)
    * [const OR](#OR)
    * [const Only](#Only)
    * [const Or](#Or)
    * [const Private](#Private)
    * [const Public](#Public)
    * [const Quoted](#Quoted)
    * [const RPAREN](#RPAREN)
    * [const Regexp](#Regexp)
    * [const RegexpType](#RegexpType)
    * [const SLASH](#SLASH)
    * [const SQUOTE](#SQUOTE)
    * [const SearchTypeLiteral](#SearchTypeLiteral)
    * [const SearchTypeRegex](#SearchTypeRegex)
    * [const SearchTypeStructural](#SearchTypeStructural)
    * [const StringType](#StringType)
    * [const Structural](#Structural)
    * [const Yes](#Yes)
    * [const allowDanglingParens](#allowDanglingParens)
    * [const disambiguated](#disambiguated)
    * [const parensAsPatterns](#parensAsPatterns)
* [Variables](#var)
    * [var DefaultPredicateRegistry](#DefaultPredicateRegistry)
    * [var ErrBadGlobPattern](#ErrBadGlobPattern)
    * [var aliases](#aliases)
    * [var allFields](#allFields)
    * [var allLabels](#allLabels)
    * [var empty](#empty)
    * [var gitHubRepoPath](#gitHubRepoPath)
    * [var globSpecialSymbols](#globSpecialSymbols)
    * [var globSyntax](#globSyntax)
    * [var nameIndex](#nameIndex)
    * [var paramsIndex](#paramsIndex)
    * [var predicateRegexp](#predicateRegexp)
* [Types](#type)
    * [type Annotation struct](#Annotation)
    * [type BaseMapper struct{}](#BaseMapper)
        * [func (*BaseMapper) MapNodes(mapper Mapper, nodes []Node) []Node](#BaseMapper.MapNodes)
        * [func (*BaseMapper) MapOperator(mapper Mapper, kind operatorKind, operands []Node) []Node](#BaseMapper.MapOperator)
        * [func (*BaseMapper) MapParameter(mapper Mapper, field, value string, negated bool, annotation Annotation) Node](#BaseMapper.MapParameter)
        * [func (*BaseMapper) MapPattern(mapper Mapper, value string, negated bool, annotation Annotation) Node](#BaseMapper.MapPattern)
    * [type BaseVisitor struct{}](#BaseVisitor)
        * [func (*BaseVisitor) VisitNodes(visitor Visitor, nodes []Node)](#BaseVisitor.VisitNodes)
        * [func (*BaseVisitor) VisitOperator(visitor Visitor, kind operatorKind, operands []Node)](#BaseVisitor.VisitOperator)
        * [func (*BaseVisitor) VisitParameter(visitor Visitor, field, value string, negated bool, annotation Annotation)](#BaseVisitor.VisitParameter)
        * [func (*BaseVisitor) VisitPattern(visitor Visitor, value string, negated bool, annotation Annotation)](#BaseVisitor.VisitPattern)
    * [type Basic struct](#Basic)
        * [func ConcatRevFilters(b Basic) Basic](#ConcatRevFilters)
        * [func Identity(b Basic) Basic](#Identity)
        * [func PatternToFile(b Basic) Basic](#PatternToFile)
        * [func ToBasicQuery(nodes []Node) (Basic, error)](#ToBasicQuery)
        * [func (b Basic) AddCount(count int) Basic](#Basic.AddCount)
        * [func (b Basic) FindParameter(field string, f func(value string, negated bool, annotation Annotation))](#Basic.FindParameter)
        * [func (b Basic) FindValue(field string) (value string)](#Basic.FindValue)
        * [func (b Basic) GetCount() string](#Basic.GetCount)
        * [func (b Basic) HasPatternLabel(label labels) bool](#Basic.HasPatternLabel)
        * [func (b Basic) Index() YesNoOnly](#Basic.Index)
        * [func (b Basic) IsCaseSensitive() bool](#Basic.IsCaseSensitive)
        * [func (b Basic) IsLiteral() bool](#Basic.IsLiteral)
        * [func (b Basic) IsRegexp() bool](#Basic.IsRegexp)
        * [func (b Basic) IsStructural() bool](#Basic.IsStructural)
        * [func (b Basic) MapCount(count int) Basic](#Basic.MapCount)
        * [func (b Basic) MapParameters(parameters []Parameter) Basic](#Basic.MapParameters)
        * [func (b Basic) MapPattern(pattern Node) Basic](#Basic.MapPattern)
        * [func (b Basic) String() string](#Basic.String)
        * [func (b Basic) ToParseTree() Q](#Basic.ToParseTree)
        * [func (b Basic) VisitParameter(field string, f func(value string, negated bool, annotation Annotation))](#Basic.VisitParameter)
    * [type BasicPass func(github.com/sourcegraph/sourcegraph/internal/search/query.Basic) github.com/sourcegraph/sourcegraph/internal/search/query.Basic](#BasicPass)
    * [type ExpectedOperand struct](#ExpectedOperand)
        * [func (e *ExpectedOperand) Error() string](#ExpectedOperand.Error)
    * [type FieldMapper struct](#FieldMapper)
        * [func (s *FieldMapper) MapParameter(mapper Mapper, field, value string, negated bool, annotation Annotation) Node](#FieldMapper.MapParameter)
    * [type FieldVisitor struct](#FieldVisitor)
        * [func (s *FieldVisitor) VisitParameter(visitor Visitor, field, value string, negated bool, annotation Annotation)](#FieldVisitor.VisitParameter)
    * [type Mapper interface](#Mapper)
    * [type Node interface](#Node)
        * [func PartitionSearchPattern(nodes []Node) (parameters []Parameter, pattern Node, err error)](#PartitionSearchPattern)
    * [type Operator struct](#Operator)
        * [func (node Operator) String() string](#Operator.String)
        * [func (Operator) node()](#Operator.node)
    * [type OperatorMapper struct](#OperatorMapper)
        * [func (s *OperatorMapper) MapOperator(mapper Mapper, kind operatorKind, operands []Node) []Node](#OperatorMapper.MapOperator)
    * [type OperatorVisitor struct](#OperatorVisitor)
        * [func (s *OperatorVisitor) VisitOperator(visitor Visitor, kind operatorKind, operands []Node)](#OperatorVisitor.VisitOperator)
    * [type Parameter struct](#Parameter)
        * [func (node Parameter) String() string](#Parameter.String)
        * [func (Parameter) node()](#Parameter.node)
    * [type ParameterMapper struct](#ParameterMapper)
        * [func (s *ParameterMapper) MapParameter(mapper Mapper, field, value string, negated bool, annotation Annotation) Node](#ParameterMapper.MapParameter)
    * [type ParameterVisitor struct](#ParameterVisitor)
        * [func (s *ParameterVisitor) VisitParameter(visitor Visitor, field, value string, negated bool, annotation Annotation)](#ParameterVisitor.VisitParameter)
    * [type Pattern struct](#Pattern)
        * [func fuzzyRegexp(patterns []Pattern) Pattern](#fuzzyRegexp)
        * [func newPattern(value string, negated bool, labels labels, range_ Range) Pattern](#newPattern)
        * [func space(patterns []Pattern) Pattern](#space)
        * [func (node Pattern) String() string](#Pattern.String)
        * [func (Pattern) node()](#Pattern.node)
    * [type PatternMapper struct](#PatternMapper)
        * [func (s *PatternMapper) MapPattern(mapper Mapper, value string, negated bool, annotation Annotation) Node](#PatternMapper.MapPattern)
    * [type PatternVisitor struct](#PatternVisitor)
        * [func (s *PatternVisitor) VisitPattern(visitor Visitor, value string, negated bool, annotation Annotation)](#PatternVisitor.VisitPattern)
    * [type Plan []query.Basic](#Plan)
        * [func MapPlan(plan Plan, pass BasicPass) Plan](#MapPlan)
        * [func Pipeline(steps ...step) (Plan, error)](#Pipeline)
        * [func ToPlan(disjuncts [][]Node) (Plan, error)](#ToPlan)
        * [func (p Plan) ToParseTree() Q](#Plan.ToParseTree)
    * [type Predicate interface](#Predicate)
    * [type Q []query.Node](#Q)
        * [func ParseLiteral(in string) (Q, error)](#ParseLiteral)
        * [func ParseRegexp(in string) (Q, error)](#ParseRegexp)
        * [func ParseSearchType(in string, searchType SearchType) (Q, error)](#ParseSearchType)
        * [func (q Q) Archived() *YesNoOnly](#Q.Archived)
        * [func (q Q) BoolValue(field string) bool](#Q.BoolValue)
        * [func (q Q) Count() *int](#Q.Count)
        * [func (q Q) Fields() map[string][]*Value](#Q.Fields)
        * [func (q Q) Fork() *YesNoOnly](#Q.Fork)
        * [func (q Q) IsCaseSensitive() bool](#Q.IsCaseSensitive)
        * [func (q Q) RegexpPatterns(field string) (values, negatedValues []string)](#Q.RegexpPatterns)
        * [func (q Q) Repositories() (repos []string, negatedRepos []string)](#Q.Repositories)
        * [func (q Q) String() string](#Q.String)
        * [func (q Q) StringValue(field string) (value, negatedValue string)](#Q.StringValue)
        * [func (q Q) StringValues(field string) (values, negatedValues []string)](#Q.StringValues)
        * [func (q Q) Timeout() *time.Duration](#Q.Timeout)
        * [func (q Q) Values(field string) []*Value](#Q.Values)
        * [func (q Q) valueToTypedValue(field, value string, label labels) []*Value](#Q.valueToTypedValue)
        * [func (q Q) yesNoOnlyValue(field string) *YesNoOnly](#Q.yesNoOnlyValue)
    * [type QueryInfo interface](#QueryInfo)
    * [type Range struct](#Range)
        * [func newRange(start int, end int) Range](#newRange)
        * [func (rrange Range) String() string](#Range.String)
    * [type RepoContainsCommitAfterPredicate struct](#RepoContainsCommitAfterPredicate)
        * [func (f RepoContainsCommitAfterPredicate) Field() string](#RepoContainsCommitAfterPredicate.Field)
        * [func (f RepoContainsCommitAfterPredicate) Name() string](#RepoContainsCommitAfterPredicate.Name)
        * [func (f *RepoContainsCommitAfterPredicate) ParseParams(params string) error](#RepoContainsCommitAfterPredicate.ParseParams)
        * [func (f *RepoContainsCommitAfterPredicate) Plan(parent Basic) (Plan, error)](#RepoContainsCommitAfterPredicate.Plan)
    * [type RepoContainsContentPredicate struct](#RepoContainsContentPredicate)
        * [func (f *RepoContainsContentPredicate) Field() string](#RepoContainsContentPredicate.Field)
        * [func (f *RepoContainsContentPredicate) Name() string](#RepoContainsContentPredicate.Name)
        * [func (f *RepoContainsContentPredicate) ParseParams(params string) error](#RepoContainsContentPredicate.ParseParams)
        * [func (f *RepoContainsContentPredicate) Plan(parent Basic) (Plan, error)](#RepoContainsContentPredicate.Plan)
    * [type RepoContainsFilePredicate struct](#RepoContainsFilePredicate)
        * [func (f *RepoContainsFilePredicate) Field() string](#RepoContainsFilePredicate.Field)
        * [func (f *RepoContainsFilePredicate) Name() string](#RepoContainsFilePredicate.Name)
        * [func (f *RepoContainsFilePredicate) ParseParams(params string) error](#RepoContainsFilePredicate.ParseParams)
        * [func (f *RepoContainsFilePredicate) Plan(parent Basic) (Plan, error)](#RepoContainsFilePredicate.Plan)
    * [type RepoContainsPredicate struct](#RepoContainsPredicate)
        * [func (f *RepoContainsPredicate) Field() string](#RepoContainsPredicate.Field)
        * [func (f *RepoContainsPredicate) Name() string](#RepoContainsPredicate.Name)
        * [func (f *RepoContainsPredicate) ParseParams(params string) error](#RepoContainsPredicate.ParseParams)
        * [func (f *RepoContainsPredicate) Plan(parent Basic) (Plan, error)](#RepoContainsPredicate.Plan)
        * [func (f *RepoContainsPredicate) parseNode(n Node) error](#RepoContainsPredicate.parseNode)
    * [type SearchType int](#SearchType)
        * [func (s SearchType) String() string](#SearchType.String)
    * [type UnsupportedError struct](#UnsupportedError)
        * [func (e *UnsupportedError) Error() string](#UnsupportedError.Error)
    * [type Value struct](#Value)
        * [func (v *Value) ToString() string](#Value.ToString)
        * [func (v *Value) Value() interface{}](#Value.Value)
    * [type ValueType int](#ValueType)
    * [type Visitor interface](#Visitor)
    * [type YesNoOnly string](#YesNoOnly)
        * [func ParseYesNoOnly(s string) YesNoOnly](#ParseYesNoOnly)
    * [type globError struct](#globError)
        * [func (g globError) Error() string](#globError.Error)
    * [type heuristics uint8](#heuristics)
    * [type keyword string](#keyword)
    * [type labels uint16](#labels)
        * [func collectLabels(nodes []Node) (result labels)](#collectLabels)
        * [func (l *labels) IsSet(label labels) bool](#labels.IsSet)
        * [func (l *labels) String() []string](#labels.String)
        * [func (l *labels) set(label labels)](#labels.set)
        * [func (l *labels) unset(label labels)](#labels.unset)
    * [type operatorKind int](#operatorKind)
    * [type parser struct](#parser)
        * [func (p *parser) ParseFieldValue(field string) (string, labels, error)](#parser.ParseFieldValue)
        * [func (p *parser) ParseParameter() (Parameter, bool, error)](#parser.ParseParameter)
        * [func (p *parser) ParsePattern(label labels) Pattern](#parser.ParsePattern)
        * [func (p *parser) TryParseDelimitedPattern() (Pattern, bool)](#parser.TryParseDelimitedPattern)
        * [func (p *parser) TryParseDelimiter() (string, rune, bool)](#parser.TryParseDelimiter)
        * [func (p *parser) TryScanBalancedPattern(label labels) (Pattern, bool)](#parser.TryScanBalancedPattern)
        * [func (p *parser) done() bool](#parser.done)
        * [func (p *parser) expect(keyword keyword) bool](#parser.expect)
        * [func (p *parser) match(keyword keyword) bool](#parser.match)
        * [func (p *parser) matchKeyword(keyword keyword) bool](#parser.matchKeyword)
        * [func (p *parser) matchUnaryKeyword(keyword keyword) bool](#parser.matchUnaryKeyword)
        * [func (p *parser) next() rune](#parser.next)
        * [func (p *parser) parseAnd() ([]Node, error)](#parser.parseAnd)
        * [func (p *parser) parseLeaves(label labels) ([]Node, error)](#parser.parseLeaves)
        * [func (p *parser) parseOr() ([]Node, error)](#parser.parseOr)
        * [func (p *parser) peek(n int) (string, error)](#parser.peek)
        * [func (p *parser) skipSpaces() error](#parser.skipSpaces)
        * [func (p *parser) tryFallbackParser(in string) ([]Node, error)](#parser.tryFallbackParser)
    * [type pass func(nodes []github.com/sourcegraph/sourcegraph/internal/search/query.Node) []github.com/sourcegraph/sourcegraph/internal/search/query.Node](#pass)
    * [type position struct](#position)
    * [type predicateRegistry map[string]map[string]func() github.com/sourcegraph/sourcegraph/internal/search/query.Predicate](#predicateRegistry)
        * [func (pr predicateRegistry) Get(field, name string) Predicate](#predicateRegistry.Get)
    * [type repoVisibility string](#repoVisibility)
        * [func ParseVisibility(s string) repoVisibility](#ParseVisibility)
    * [type step func(nodes []github.com/sourcegraph/sourcegraph/internal/search/query.Node) ([]github.com/sourcegraph/sourcegraph/internal/search/query.Node, error)](#step)
        * [func For(searchType SearchType) step](#For)
        * [func Init(in string, searchType SearchType) step](#Init)
        * [func InitLiteral(in string) step](#InitLiteral)
        * [func InitRegexp(in string) step](#InitRegexp)
        * [func InitStructural(in string) step](#InitStructural)
        * [func With(enabled bool, step step) step](#With)
        * [func sequence(steps ...step) step](#sequence)
        * [func succeeds(passes ...pass) step](#succeeds)
* [Functions](#func)
    * [func AddRegexpField(q Q, field, pattern string) string](#AddRegexpField)
    * [func ContainsNoGlobSyntax(value string) bool](#ContainsNoGlobSyntax)
    * [func ContainsRefGlobs(q Q) bool](#ContainsRefGlobs)
    * [func ContainsRegexpMetasyntax(input string) bool](#ContainsRegexpMetasyntax)
    * [func Dnf(query []Node) [][]Node](#Dnf)
    * [func FuzzifyRegexPatterns(nodes []Node) []Node](#FuzzifyRegexPatterns)
    * [func Globbing(nodes []Node) ([]Node, error)](#Globbing)
    * [func HasTypeRepo(q Q) bool](#HasTypeRepo)
    * [func Hoist(nodes []Node) ([]Node, error)](#Hoist)
    * [func IsBasic(nodes []Node) bool](#IsBasic)
    * [func IsPatternAtom(b Basic) bool](#IsPatternAtom)
    * [func IsStreamingCompatible(p Plan) bool](#IsStreamingCompatible)
    * [func LooksLikeGitHubRepo(value string) bool](#LooksLikeGitHubRepo)
    * [func LowercaseFieldNames(nodes []Node) []Node](#LowercaseFieldNames)
    * [func Map(query []Node, fns ...func([]Node) []Node) []Node](#Map)
    * [func MapField(nodes []Node, field string, callback func(value string, negated bool) Node) []Node](#MapField)
    * [func MapOperator(nodes []Node, callback func(kind operatorKind, operands []Node) []Node) []Node](#MapOperator)
    * [func MapParameter(nodes []Node, callback func(field, value string, negated bool, annotation Annotation) Node) []Node](#MapParameter)
    * [func MapPattern(nodes []Node, callback func(value string, negated bool, annotation Annotation) Node) []Node](#MapPattern)
    * [func OmitField(q Q, field string) string](#OmitField)
    * [func OverrideField(nodes []Node, field, value string) []Node](#OverrideField)
    * [func Parse(in string, searchType SearchType) ([]Node, error)](#Parse)
    * [func ParseAsPredicate(value string) (name, params string)](#ParseAsPredicate)
    * [func Run(step step) ([]Node, error)](#Run)
    * [func ScanAnyPattern(buf []byte) (scanned string, count int)](#ScanAnyPattern)
    * [func ScanBalancedParens(buf []byte) (string, int, bool)](#ScanBalancedParens)
    * [func ScanBalancedPattern(buf []byte) (scanned string, count int, ok bool)](#ScanBalancedPattern)
    * [func ScanDelimited(buf []byte, strict bool, delimiter rune) (string, int, error)](#ScanDelimited)
    * [func ScanField(buf []byte) (string, bool, int)](#ScanField)
    * [func ScanPredicate(field string, buf []byte) (string, int, bool)](#ScanPredicate)
    * [func ScanPredicateName(fieldRegistry map[string]func() Predicate, buf []byte) (string, int, bool)](#ScanPredicateName)
    * [func ScanValue(buf []byte, allowDanglingParens bool) (string, int)](#ScanValue)
    * [func StringHuman(nodes []Node) string](#StringHuman)
    * [func SubstituteAliases(searchType SearchType) func(nodes []Node) []Node](#SubstituteAliases)
    * [func SubstituteCountAll(nodes []Node) []Node](#SubstituteCountAll)
    * [func TestAndOrQuery_IsCaseSensitive(t *testing.T)](#TestAndOrQuery_IsCaseSensitive)
    * [func TestAndOrQuery_RegexpPatterns(t *testing.T)](#TestAndOrQuery_RegexpPatterns)
    * [func TestAndOrQuery_Validation(t *testing.T)](#TestAndOrQuery_Validation)
    * [func TestConcatRevFilters(t *testing.T)](#TestConcatRevFilters)
    * [func TestConcatRevFiltersTopLevelAnd(t *testing.T)](#TestConcatRevFiltersTopLevelAnd)
    * [func TestContainsNoGlobSyntax(t *testing.T)](#TestContainsNoGlobSyntax)
    * [func TestContainsRefGlobs(t *testing.T)](#TestContainsRefGlobs)
    * [func TestConvertEmptyGroupsToLiteral(t *testing.T)](#TestConvertEmptyGroupsToLiteral)
    * [func TestEllipsesForHoles(t *testing.T)](#TestEllipsesForHoles)
    * [func TestExpandOr(t *testing.T)](#TestExpandOr)
    * [func TestForAll(t *testing.T)](#TestForAll)
    * [func TestFuzzifyGlobPattern(t *testing.T)](#TestFuzzifyGlobPattern)
    * [func TestFuzzifyRegexPatterns(t *testing.T)](#TestFuzzifyRegexPatterns)
    * [func TestHasTypeRepo(t *testing.T)](#TestHasTypeRepo)
    * [func TestHoist(t *testing.T)](#TestHoist)
    * [func TestLowercaseFieldNames(t *testing.T)](#TestLowercaseFieldNames)
    * [func TestMap(t *testing.T)](#TestMap)
    * [func TestMapField(t *testing.T)](#TestMapField)
    * [func TestMapGlobToRegex(t *testing.T)](#TestMapGlobToRegex)
    * [func TestMapOperator(t *testing.T)](#TestMapOperator)
    * [func TestMatchUnaryKeyword(t *testing.T)](#TestMatchUnaryKeyword)
    * [func TestMergePatterns(t *testing.T)](#TestMergePatterns)
    * [func TestParse(t *testing.T)](#TestParse)
    * [func TestParseAndOrLiteral(t *testing.T)](#TestParseAndOrLiteral)
    * [func TestParseAsPredicate(t *testing.T)](#TestParseAsPredicate)
    * [func TestParseParameterList(t *testing.T)](#TestParseParameterList)
    * [func TestPartitionSearchPattern(t *testing.T)](#TestPartitionSearchPattern)
    * [func TestPipeline(t *testing.T)](#TestPipeline)
    * [func TestPipeline_equivalence(t *testing.T)](#TestPipeline_equivalence)
    * [func TestQueryField(t *testing.T)](#TestQueryField)
    * [func TestRepoContainsPredicate(t *testing.T)](#TestRepoContainsPredicate)
    * [func TestReporevToRegex(t *testing.T)](#TestReporevToRegex)
    * [func TestScanBalancedPattern(t *testing.T)](#TestScanBalancedPattern)
    * [func TestScanDelimited(t *testing.T)](#TestScanDelimited)
    * [func TestScanField(t *testing.T)](#TestScanField)
    * [func TestScanPredicate(t *testing.T)](#TestScanPredicate)
    * [func TestStringHuman(t *testing.T)](#TestStringHuman)
    * [func TestSubstituteAliases(t *testing.T)](#TestSubstituteAliases)
    * [func TestSubstituteConcat(t *testing.T)](#TestSubstituteConcat)
    * [func TestSubstituteCountAll(t *testing.T)](#TestSubstituteCountAll)
    * [func TestSubstituteOrForRegexp(t *testing.T)](#TestSubstituteOrForRegexp)
    * [func TestTranslateBadGlobPattern(t *testing.T)](#TestTranslateBadGlobPattern)
    * [func TestTranslateGlobToRegex(t *testing.T)](#TestTranslateGlobToRegex)
    * [func ToNodes(parameters []Parameter) []Node](#ToNodes)
    * [func Validate(disjuncts [][]Node) error](#Validate)
    * [func VisitField(nodes []Node, field string, callback func(value string, negated bool, annotation Annotation))](#VisitField)
    * [func VisitOperator(nodes []Node, callback func(kind operatorKind, operands []Node))](#VisitOperator)
    * [func VisitParameter(nodes []Node, callback func(field, value string, negated bool, annotation Annotation))](#VisitParameter)
    * [func VisitPattern(nodes []Node, callback func(value string, negated bool, annotation Annotation))](#VisitPattern)
    * [func containsPattern(node Node) bool](#containsPattern)
    * [func distribute(prefixes [][]Node, nodes []Node) [][]Node](#distribute)
    * [func ellipsesForHoles(nodes []Node) []Node](#ellipsesForHoles)
    * [func escapeParens(s string) string](#escapeParens)
    * [func escapeParensHeuristic(nodes []Node) []Node](#escapeParensHeuristic)
    * [func exists(nodes []Node, fn func(node Node) bool) bool](#exists)
    * [func forAll(nodes []Node, fn func(node Node) bool) bool](#forAll)
    * [func fuzzifyGlobPattern(value string) string](#fuzzifyGlobPattern)
    * [func globToRegex(value string) (string, error)](#globToRegex)
    * [func identity(nodes []Node) ([]Node, error)](#identity)
    * [func isPatternExpression(nodes []Node) bool](#isPatternExpression)
    * [func isSet(h, heuristic heuristics) bool](#isSet)
    * [func isSpace(buf []byte) bool](#isSpace)
    * [func labelStructural(nodes []Node) []Node](#labelStructural)
    * [func labelsToString(nodes []Node) string](#labelsToString)
    * [func newOperator(nodes []Node, kind operatorKind) []Node](#newOperator)
    * [func nodesToJSON(nodes []Node) string](#nodesToJSON)
    * [func nonPredicateRepos(q Basic) []Node](#nonPredicateRepos)
    * [func parseAndOrGrammar(in string) ([]Node, error)](#parseAndOrGrammar)
    * [func parseBool(s string) (bool, error)](#parseBool)
    * [func parseRegexpOrPanic(field, value string) *regexp.Regexp](#parseRegexpOrPanic)
    * [func partition(nodes []Node, fn func(node Node) bool) (left, right []Node)](#partition)
    * [func partitionParameters(nodes []Node) []Node](#partitionParameters)
    * [func planToString(disjuncts [][]Node) string](#planToString)
    * [func processTopLevel(nodes []Node) ([]Node, error)](#processTopLevel)
    * [func product(left [][]Node, right []Node) [][]Node](#product)
    * [func reduce(left, right []Node, kind operatorKind) ([]Node, bool)](#reduce)
    * [func reporevToRegex(value string) (string, error)](#reporevToRegex)
    * [func resolveFieldAlias(field string) string](#resolveFieldAlias)
    * [func skipSpace(buf []byte) int](#skipSpace)
    * [func stringHumanParameters(parameters []Parameter) string](#stringHumanParameters)
    * [func stringHumanPattern(nodes []Node) string](#stringHumanPattern)
    * [func substituteConcat(callback func([]Pattern) Pattern) func(nodes []Node) []Node](#substituteConcat)
    * [func substituteOrForRegexp(nodes []Node) []Node](#substituteOrForRegexp)
    * [func toJSON(node Node) interface{}](#toJSON)
    * [func toParameters(nodes []Node) []Parameter](#toParameters)
    * [func toString(nodes []Node) string](#toString)
    * [func translateCharacterClass(r []rune, startIx int) (int, string, error)](#translateCharacterClass)
    * [func validate(nodes []Node) error](#validate)
    * [func validateCommitParameters(nodes []Node) error](#validateCommitParameters)
    * [func validateField(field, value string, negated bool, seen map[string]struct{}) error](#validateField)
    * [func validateParameters(nodes []Node) error](#validateParameters)
    * [func validatePattern(nodes []Node) error](#validatePattern)
    * [func validatePredicates(nodes []Node) error](#validatePredicates)
    * [func validatePureLiteralPattern(nodes []Node, balanced bool) error](#validatePureLiteralPattern)
    * [func validateRepoHasFile(nodes []Node) error](#validateRepoHasFile)
    * [func validateRepoRevPair(nodes []Node) error](#validateRepoRevPair)
    * [func validateTypeStructural(nodes []Node) error](#validateTypeStructural)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="AND" href="#AND">const AND</a>

```
searchKey: query.AND
tags: [constant string]
```

```Go
const AND keyword = "and"
```

Reserved keyword syntax. 

### <a id="And" href="#And">const And</a>

```
searchKey: query.And
tags: [constant number]
```

```Go
const And
```

### <a id="Any" href="#Any">const Any</a>

```
searchKey: query.Any
tags: [constant string]
```

```Go
const Any repoVisibility = "any"
```

### <a id="BoolType" href="#BoolType">const BoolType</a>

```
searchKey: query.BoolType
tags: [constant number]
```

```Go
const BoolType
```

All ValueType values. 

### <a id="Concat" href="#Concat">const Concat</a>

```
searchKey: query.Concat
tags: [constant number]
```

```Go
const Concat
```

### <a id="DQUOTE" href="#DQUOTE">const DQUOTE</a>

```
searchKey: query.DQUOTE
tags: [constant string]
```

```Go
const DQUOTE keyword = "\""
```

Reserved keyword syntax. 

### <a id="FieldAfter" href="#FieldAfter">const FieldAfter</a>

```
searchKey: query.FieldAfter
tags: [constant string]
```

```Go
const FieldAfter = "after"
```

All field names. 

### <a id="FieldArchived" href="#FieldArchived">const FieldArchived</a>

```
searchKey: query.FieldArchived
tags: [constant string]
```

```Go
const FieldArchived = "archived"
```

All field names. 

### <a id="FieldAuthor" href="#FieldAuthor">const FieldAuthor</a>

```
searchKey: query.FieldAuthor
tags: [constant string]
```

```Go
const FieldAuthor = "author"
```

All field names. 

### <a id="FieldBefore" href="#FieldBefore">const FieldBefore</a>

```
searchKey: query.FieldBefore
tags: [constant string]
```

```Go
const FieldBefore = "before"
```

All field names. 

For diff and commit search only: 

### <a id="FieldCase" href="#FieldCase">const FieldCase</a>

```
searchKey: query.FieldCase
tags: [constant string]
```

```Go
const FieldCase = "case"
```

All field names. 

### <a id="FieldCombyRule" href="#FieldCombyRule">const FieldCombyRule</a>

```
searchKey: query.FieldCombyRule
tags: [constant string]
```

```Go
const FieldCombyRule = "rule"
```

All field names. 

### <a id="FieldCommitter" href="#FieldCommitter">const FieldCommitter</a>

```
searchKey: query.FieldCommitter
tags: [constant string]
```

```Go
const FieldCommitter = "committer"
```

All field names. 

### <a id="FieldContent" href="#FieldContent">const FieldContent</a>

```
searchKey: query.FieldContent
tags: [constant string]
```

```Go
const FieldContent = "content"
```

All field names. 

### <a id="FieldContext" href="#FieldContext">const FieldContext</a>

```
searchKey: query.FieldContext
tags: [constant string]
```

```Go
const FieldContext = "context"
```

All field names. 

### <a id="FieldCount" href="#FieldCount">const FieldCount</a>

```
searchKey: query.FieldCount
tags: [constant string]
```

```Go
const FieldCount // Searches that specify `count:` will fetch at least that number of results, or the full result set
 = ...
```

All field names. 

### <a id="FieldDefault" href="#FieldDefault">const FieldDefault</a>

```
searchKey: query.FieldDefault
tags: [constant string]
```

```Go
const FieldDefault = ""
```

All field names. 

### <a id="FieldFile" href="#FieldFile">const FieldFile</a>

```
searchKey: query.FieldFile
tags: [constant string]
```

```Go
const FieldFile = "file"
```

All field names. 

### <a id="FieldFork" href="#FieldFork">const FieldFork</a>

```
searchKey: query.FieldFork
tags: [constant string]
```

```Go
const FieldFork = "fork"
```

All field names. 

### <a id="FieldIndex" href="#FieldIndex">const FieldIndex</a>

```
searchKey: query.FieldIndex
tags: [constant string]
```

```Go
const FieldIndex = "index"
```

All field names. 

Temporary experimental fields: 

### <a id="FieldLang" href="#FieldLang">const FieldLang</a>

```
searchKey: query.FieldLang
tags: [constant string]
```

```Go
const FieldLang = "lang"
```

All field names. 

### <a id="FieldMessage" href="#FieldMessage">const FieldMessage</a>

```
searchKey: query.FieldMessage
tags: [constant string]
```

```Go
const FieldMessage = "message"
```

All field names. 

### <a id="FieldPatternType" href="#FieldPatternType">const FieldPatternType</a>

```
searchKey: query.FieldPatternType
tags: [constant string]
```

```Go
const FieldPatternType = "patterntype"
```

All field names. 

### <a id="FieldRepo" href="#FieldRepo">const FieldRepo</a>

```
searchKey: query.FieldRepo
tags: [constant string]
```

```Go
const FieldRepo = "repo"
```

All field names. 

### <a id="FieldRepoGroup" href="#FieldRepoGroup">const FieldRepoGroup</a>

```
searchKey: query.FieldRepoGroup
tags: [constant string]
```

```Go
const FieldRepoGroup = "repogroup"
```

All field names. 

### <a id="FieldRepoHasCommitAfter" href="#FieldRepoHasCommitAfter">const FieldRepoHasCommitAfter</a>

```
searchKey: query.FieldRepoHasCommitAfter
tags: [constant string]
```

```Go
const FieldRepoHasCommitAfter = "repohascommitafter"
```

All field names. 

### <a id="FieldRepoHasFile" href="#FieldRepoHasFile">const FieldRepoHasFile</a>

```
searchKey: query.FieldRepoHasFile
tags: [constant string]
```

```Go
const FieldRepoHasFile = "repohasfile"
```

All field names. 

### <a id="FieldRev" href="#FieldRev">const FieldRev</a>

```
searchKey: query.FieldRev
tags: [constant string]
```

```Go
const FieldRev = "rev"
```

All field names. 

### <a id="FieldSelect" href="#FieldSelect">const FieldSelect</a>

```
searchKey: query.FieldSelect
tags: [constant string]
```

```Go
const FieldSelect = "select"
```

All field names. 

### <a id="FieldStable" href="#FieldStable">const FieldStable</a>

```
searchKey: query.FieldStable
tags: [constant string]
```

```Go
const FieldStable // Forces search to return a stable result ordering (currently limited to file content matches).
 = ...
```

All field names. 

### <a id="FieldTimeout" href="#FieldTimeout">const FieldTimeout</a>

```
searchKey: query.FieldTimeout
tags: [constant string]
```

```Go
const FieldTimeout = "timeout"
```

All field names. 

### <a id="FieldType" href="#FieldType">const FieldType</a>

```
searchKey: query.FieldType
tags: [constant string]
```

```Go
const FieldType = "type"
```

All field names. 

### <a id="FieldVisibility" href="#FieldVisibility">const FieldVisibility</a>

```
searchKey: query.FieldVisibility
tags: [constant string]
```

```Go
const FieldVisibility = "visibility"
```

All field names. 

### <a id="HeuristicDanglingParens" href="#HeuristicDanglingParens">const HeuristicDanglingParens</a>

```
searchKey: query.HeuristicDanglingParens
tags: [constant number]
```

```Go
const HeuristicDanglingParens
```

### <a id="HeuristicHoisted" href="#HeuristicHoisted">const HeuristicHoisted</a>

```
searchKey: query.HeuristicHoisted
tags: [constant number]
```

```Go
const HeuristicHoisted
```

### <a id="HeuristicParensAsPatterns" href="#HeuristicParensAsPatterns">const HeuristicParensAsPatterns</a>

```
searchKey: query.HeuristicParensAsPatterns
tags: [constant number]
```

```Go
const HeuristicParensAsPatterns
```

### <a id="Invalid" href="#Invalid">const Invalid</a>

```
searchKey: query.Invalid
tags: [constant string]
```

```Go
const Invalid YesNoOnly = "invalid"
```

### <a id="IsPredicate" href="#IsPredicate">const IsPredicate</a>

```
searchKey: query.IsPredicate
tags: [constant number]
```

```Go
const IsPredicate
```

### <a id="LPAREN" href="#LPAREN">const LPAREN</a>

```
searchKey: query.LPAREN
tags: [constant string]
```

```Go
const LPAREN keyword = "("
```

Reserved keyword syntax. 

### <a id="Literal" href="#Literal">const Literal</a>

```
searchKey: query.Literal
tags: [constant number]
```

```Go
const Literal = 1 << iota
```

### <a id="NOT" href="#NOT">const NOT</a>

```
searchKey: query.NOT
tags: [constant string]
```

```Go
const NOT keyword = "not"
```

Reserved keyword syntax. 

### <a id="No" href="#No">const No</a>

```
searchKey: query.No
tags: [constant string]
```

```Go
const No YesNoOnly = "no"
```

### <a id="None" href="#None">const None</a>

```
searchKey: query.None
tags: [constant number]
```

```Go
const None labels = 0
```

### <a id="OR" href="#OR">const OR</a>

```
searchKey: query.OR
tags: [constant string]
```

```Go
const OR keyword = "or"
```

Reserved keyword syntax. 

### <a id="Only" href="#Only">const Only</a>

```
searchKey: query.Only
tags: [constant string]
```

```Go
const Only YesNoOnly = "only"
```

### <a id="Or" href="#Or">const Or</a>

```
searchKey: query.Or
tags: [constant number]
```

```Go
const Or operatorKind = iota
```

### <a id="Private" href="#Private">const Private</a>

```
searchKey: query.Private
tags: [constant string]
```

```Go
const Private repoVisibility = "private"
```

### <a id="Public" href="#Public">const Public</a>

```
searchKey: query.Public
tags: [constant string]
```

```Go
const Public repoVisibility = "public"
```

### <a id="Quoted" href="#Quoted">const Quoted</a>

```
searchKey: query.Quoted
tags: [constant number]
```

```Go
const Quoted
```

### <a id="RPAREN" href="#RPAREN">const RPAREN</a>

```
searchKey: query.RPAREN
tags: [constant string]
```

```Go
const RPAREN keyword = ")"
```

Reserved keyword syntax. 

### <a id="Regexp" href="#Regexp">const Regexp</a>

```
searchKey: query.Regexp
tags: [constant number]
```

```Go
const Regexp
```

### <a id="RegexpType" href="#RegexpType">const RegexpType</a>

```
searchKey: query.RegexpType
tags: [constant number]
```

```Go
const RegexpType
```

All ValueType values. 

### <a id="SLASH" href="#SLASH">const SLASH</a>

```
searchKey: query.SLASH
tags: [constant string]
```

```Go
const SLASH keyword = "/"
```

Reserved keyword syntax. 

### <a id="SQUOTE" href="#SQUOTE">const SQUOTE</a>

```
searchKey: query.SQUOTE
tags: [constant string]
```

```Go
const SQUOTE keyword = "'"
```

Reserved keyword syntax. 

### <a id="SearchTypeLiteral" href="#SearchTypeLiteral">const SearchTypeLiteral</a>

```
searchKey: query.SearchTypeLiteral
tags: [constant number]
```

```Go
const SearchTypeLiteral
```

### <a id="SearchTypeRegex" href="#SearchTypeRegex">const SearchTypeRegex</a>

```
searchKey: query.SearchTypeRegex
tags: [constant number]
```

```Go
const SearchTypeRegex SearchType = iota
```

### <a id="SearchTypeStructural" href="#SearchTypeStructural">const SearchTypeStructural</a>

```
searchKey: query.SearchTypeStructural
tags: [constant number]
```

```Go
const SearchTypeStructural
```

### <a id="StringType" href="#StringType">const StringType</a>

```
searchKey: query.StringType
tags: [constant number]
```

```Go
const StringType ValueType = 1 << iota
```

All ValueType values. 

### <a id="Structural" href="#Structural">const Structural</a>

```
searchKey: query.Structural
tags: [constant number]
```

```Go
const Structural
```

### <a id="Yes" href="#Yes">const Yes</a>

```
searchKey: query.Yes
tags: [constant string]
```

```Go
const Yes YesNoOnly = "yes"
```

### <a id="allowDanglingParens" href="#allowDanglingParens">const allowDanglingParens</a>

```
searchKey: query.allowDanglingParens
tags: [constant number private]
```

```Go
const allowDanglingParens
```

If set, all parentheses, whether balanced or unbalanced, are parsed as literal search patterns (i.e., interpreting parentheses as expression groups is completely disabled). 

### <a id="disambiguated" href="#disambiguated">const disambiguated</a>

```
searchKey: query.disambiguated
tags: [constant number private]
```

```Go
const disambiguated
```

If set, implies that at least one expression was disambiguated by explicit parentheses. 

### <a id="parensAsPatterns" href="#parensAsPatterns">const parensAsPatterns</a>

```
searchKey: query.parensAsPatterns
tags: [constant number private]
```

```Go
const parensAsPatterns heuristics = 1 << iota
```

If set, balanced parentheses, which would normally be treated as delimiting expression groups, may in select cases be parsed as literal search patterns instead. 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="DefaultPredicateRegistry" href="#DefaultPredicateRegistry">var DefaultPredicateRegistry</a>

```
searchKey: query.DefaultPredicateRegistry
tags: [variable object]
```

```Go
var DefaultPredicateRegistry = ...
```

### <a id="ErrBadGlobPattern" href="#ErrBadGlobPattern">var ErrBadGlobPattern</a>

```
searchKey: query.ErrBadGlobPattern
tags: [variable interface]
```

```Go
var ErrBadGlobPattern = errors.New("syntax error in glob pattern")
```

### <a id="aliases" href="#aliases">var aliases</a>

```
searchKey: query.aliases
tags: [variable object private]
```

```Go
var aliases = ...
```

### <a id="allFields" href="#allFields">var allFields</a>

```
searchKey: query.allFields
tags: [variable object private]
```

```Go
var allFields = ...
```

### <a id="allLabels" href="#allLabels">var allLabels</a>

```
searchKey: query.allLabels
tags: [variable object private]
```

```Go
var allLabels = ...
```

### <a id="empty" href="#empty">var empty</a>

```
searchKey: query.empty
tags: [variable struct private]
```

```Go
var empty = struct{}{}
```

### <a id="gitHubRepoPath" href="#gitHubRepoPath">var gitHubRepoPath</a>

```
searchKey: query.gitHubRepoPath
tags: [variable struct private]
```

```Go
var gitHubRepoPath = lazyregexp.New(`github\.com\/([a-z\d]+-)*[a-z\d]+\/(.+)`)
```

### <a id="globSpecialSymbols" href="#globSpecialSymbols">var globSpecialSymbols</a>

```
searchKey: query.globSpecialSymbols
tags: [variable object private]
```

```Go
var globSpecialSymbols = map[rune]struct{}{
	'\\': {},
	'*':  {},
	'?':  {},
	'[':  {},
}
```

### <a id="globSyntax" href="#globSyntax">var globSyntax</a>

```
searchKey: query.globSyntax
tags: [variable struct private]
```

```Go
var globSyntax = lazyregexp.New(`[][*?]`)
```

### <a id="nameIndex" href="#nameIndex">var nameIndex</a>

```
searchKey: query.nameIndex
tags: [variable number private]
```

```Go
var nameIndex = predicateRegexp.SubexpIndex("name")
```

### <a id="paramsIndex" href="#paramsIndex">var paramsIndex</a>

```
searchKey: query.paramsIndex
tags: [variable number private]
```

```Go
var paramsIndex = predicateRegexp.SubexpIndex("params")
```

### <a id="predicateRegexp" href="#predicateRegexp">var predicateRegexp</a>

```
searchKey: query.predicateRegexp
tags: [variable struct private]
```

```Go
var predicateRegexp = regexp.MustCompile(`^(?P<name>[a-z\.]+)\((?s:(?P<params>.*))\)$`)
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Annotation" href="#Annotation">type Annotation struct</a>

```
searchKey: query.Annotation
tags: [struct]
```

```Go
type Annotation struct {
	Labels labels `json:"labels"`
	Range  Range  `json:"range"`
}
```

An annotation stores information associated with a node. 

### <a id="BaseMapper" href="#BaseMapper">type BaseMapper struct{}</a>

```
searchKey: query.BaseMapper
tags: [struct]
```

```Go
type BaseMapper struct{}
```

The BaseMapper is a mapper that recursively visits each node in a query and maps it to itself. A BaseMapper's methods may be overriden by embedding it a custom mapper's definition. See ParameterMapper for an example. If the methods return nil, the respective node is removed. 

#### <a id="BaseMapper.MapNodes" href="#BaseMapper.MapNodes">func (*BaseMapper) MapNodes(mapper Mapper, nodes []Node) []Node</a>

```
searchKey: query.BaseMapper.MapNodes
tags: [method]
```

```Go
func (*BaseMapper) MapNodes(mapper Mapper, nodes []Node) []Node
```

#### <a id="BaseMapper.MapOperator" href="#BaseMapper.MapOperator">func (*BaseMapper) MapOperator(mapper Mapper, kind operatorKind, operands []Node) []Node</a>

```
searchKey: query.BaseMapper.MapOperator
tags: [method]
```

```Go
func (*BaseMapper) MapOperator(mapper Mapper, kind operatorKind, operands []Node) []Node
```

Base mapper for Operators. Reduces operands if changed. 

#### <a id="BaseMapper.MapParameter" href="#BaseMapper.MapParameter">func (*BaseMapper) MapParameter(mapper Mapper, field, value string, negated bool, annotation Annotation) Node</a>

```
searchKey: query.BaseMapper.MapParameter
tags: [method]
```

```Go
func (*BaseMapper) MapParameter(mapper Mapper, field, value string, negated bool, annotation Annotation) Node
```

Base mapper for Parameters. It is the identity function. 

#### <a id="BaseMapper.MapPattern" href="#BaseMapper.MapPattern">func (*BaseMapper) MapPattern(mapper Mapper, value string, negated bool, annotation Annotation) Node</a>

```
searchKey: query.BaseMapper.MapPattern
tags: [method]
```

```Go
func (*BaseMapper) MapPattern(mapper Mapper, value string, negated bool, annotation Annotation) Node
```

Base mapper for Patterns. It is the identity function. 

### <a id="BaseVisitor" href="#BaseVisitor">type BaseVisitor struct{}</a>

```
searchKey: query.BaseVisitor
tags: [struct]
```

```Go
type BaseVisitor struct{}
```

BaseVisitor is a visitor that recursively visits each node in a query. A BaseVisitor's methods may be overriden by embedding it a custom visitor's definition. See OperatorVisitor for an example. 

#### <a id="BaseVisitor.VisitNodes" href="#BaseVisitor.VisitNodes">func (*BaseVisitor) VisitNodes(visitor Visitor, nodes []Node)</a>

```
searchKey: query.BaseVisitor.VisitNodes
tags: [method]
```

```Go
func (*BaseVisitor) VisitNodes(visitor Visitor, nodes []Node)
```

#### <a id="BaseVisitor.VisitOperator" href="#BaseVisitor.VisitOperator">func (*BaseVisitor) VisitOperator(visitor Visitor, kind operatorKind, operands []Node)</a>

```
searchKey: query.BaseVisitor.VisitOperator
tags: [method]
```

```Go
func (*BaseVisitor) VisitOperator(visitor Visitor, kind operatorKind, operands []Node)
```

#### <a id="BaseVisitor.VisitParameter" href="#BaseVisitor.VisitParameter">func (*BaseVisitor) VisitParameter(visitor Visitor, field, value string, negated bool, annotation Annotation)</a>

```
searchKey: query.BaseVisitor.VisitParameter
tags: [method]
```

```Go
func (*BaseVisitor) VisitParameter(visitor Visitor, field, value string, negated bool, annotation Annotation)
```

#### <a id="BaseVisitor.VisitPattern" href="#BaseVisitor.VisitPattern">func (*BaseVisitor) VisitPattern(visitor Visitor, value string, negated bool, annotation Annotation)</a>

```
searchKey: query.BaseVisitor.VisitPattern
tags: [method]
```

```Go
func (*BaseVisitor) VisitPattern(visitor Visitor, value string, negated bool, annotation Annotation)
```

### <a id="Basic" href="#Basic">type Basic struct</a>

```
searchKey: query.Basic
tags: [struct]
```

```Go
type Basic struct {
	Pattern    Node
	Parameters []Parameter
}
```

Basic represents a leaf expression to evaluate in our search engine. A basic query comprises: 

```
(1) a single search pattern expression, which may contain
    'and' or 'or' operators; and
(2) parameters that scope the evaluation of search
    patterns (e.g., to repos, files, etc.).

```
#### <a id="ConcatRevFilters" href="#ConcatRevFilters">func ConcatRevFilters(b Basic) Basic</a>

```
searchKey: query.ConcatRevFilters
tags: [function]
```

```Go
func ConcatRevFilters(b Basic) Basic
```

concatRevFilters removes rev: filters from parameters and attaches their value as @rev to the repo: filters. Invariant: Guaranteed to succeed on a validat Basic query. 

#### <a id="Identity" href="#Identity">func Identity(b Basic) Basic</a>

```
searchKey: query.Identity
tags: [function]
```

```Go
func Identity(b Basic) Basic
```

Identity is the identity transformer for basic queries. 

#### <a id="PatternToFile" href="#PatternToFile">func PatternToFile(b Basic) Basic</a>

```
searchKey: query.PatternToFile
tags: [function]
```

```Go
func PatternToFile(b Basic) Basic
```

PatternToFile transforms a search query such that `file:` is prefixed to the pattern. This transformation is used for generating suggestions. Succeeds only when the pattern expression is an atom. 

#### <a id="ToBasicQuery" href="#ToBasicQuery">func ToBasicQuery(nodes []Node) (Basic, error)</a>

```
searchKey: query.ToBasicQuery
tags: [function]
```

```Go
func ToBasicQuery(nodes []Node) (Basic, error)
```

Converts a parse tree to a basic query by attempting to obtain a valid partition. 

#### <a id="Basic.AddCount" href="#Basic.AddCount">func (b Basic) AddCount(count int) Basic</a>

```
searchKey: query.Basic.AddCount
tags: [method]
```

```Go
func (b Basic) AddCount(count int) Basic
```

AddCount adds a count parameter to a basic query. Behavior of AddCount on a query that already has a count parameter is undefined. 

#### <a id="Basic.FindParameter" href="#Basic.FindParameter">func (b Basic) FindParameter(field string, f func(value string, negated bool, annotation Annotation))</a>

```
searchKey: query.Basic.FindParameter
tags: [method]
```

```Go
func (b Basic) FindParameter(field string, f func(value string, negated bool, annotation Annotation))
```

FindParameter calls f on parameters matching field in b. 

#### <a id="Basic.FindValue" href="#Basic.FindValue">func (b Basic) FindValue(field string) (value string)</a>

```
searchKey: query.Basic.FindValue
tags: [method]
```

```Go
func (b Basic) FindValue(field string) (value string)
```

FindValue returns the first value of a parameter matching field in b. It doesn't inspect whether the field is negated. 

#### <a id="Basic.GetCount" href="#Basic.GetCount">func (b Basic) GetCount() string</a>

```
searchKey: query.Basic.GetCount
tags: [method]
```

```Go
func (b Basic) GetCount() string
```

GetCount returns the string value of the "count:" field. Returns empty string if none. 

#### <a id="Basic.HasPatternLabel" href="#Basic.HasPatternLabel">func (b Basic) HasPatternLabel(label labels) bool</a>

```
searchKey: query.Basic.HasPatternLabel
tags: [method]
```

```Go
func (b Basic) HasPatternLabel(label labels) bool
```

HasPatternLabel returns whether a pattern atom has a specified label. 

#### <a id="Basic.Index" href="#Basic.Index">func (b Basic) Index() YesNoOnly</a>

```
searchKey: query.Basic.Index
tags: [method]
```

```Go
func (b Basic) Index() YesNoOnly
```

#### <a id="Basic.IsCaseSensitive" href="#Basic.IsCaseSensitive">func (b Basic) IsCaseSensitive() bool</a>

```
searchKey: query.Basic.IsCaseSensitive
tags: [method]
```

```Go
func (b Basic) IsCaseSensitive() bool
```

#### <a id="Basic.IsLiteral" href="#Basic.IsLiteral">func (b Basic) IsLiteral() bool</a>

```
searchKey: query.Basic.IsLiteral
tags: [method]
```

```Go
func (b Basic) IsLiteral() bool
```

#### <a id="Basic.IsRegexp" href="#Basic.IsRegexp">func (b Basic) IsRegexp() bool</a>

```
searchKey: query.Basic.IsRegexp
tags: [method]
```

```Go
func (b Basic) IsRegexp() bool
```

#### <a id="Basic.IsStructural" href="#Basic.IsStructural">func (b Basic) IsStructural() bool</a>

```
searchKey: query.Basic.IsStructural
tags: [method]
```

```Go
func (b Basic) IsStructural() bool
```

#### <a id="Basic.MapCount" href="#Basic.MapCount">func (b Basic) MapCount(count int) Basic</a>

```
searchKey: query.Basic.MapCount
tags: [method]
```

```Go
func (b Basic) MapCount(count int) Basic
```

MapCount returns a copy of a basic query with a count parameter set. 

#### <a id="Basic.MapParameters" href="#Basic.MapParameters">func (b Basic) MapParameters(parameters []Parameter) Basic</a>

```
searchKey: query.Basic.MapParameters
tags: [method]
```

```Go
func (b Basic) MapParameters(parameters []Parameter) Basic
```

MapParameters returns a copy of a basic query with updated parameters. 

#### <a id="Basic.MapPattern" href="#Basic.MapPattern">func (b Basic) MapPattern(pattern Node) Basic</a>

```
searchKey: query.Basic.MapPattern
tags: [method]
```

```Go
func (b Basic) MapPattern(pattern Node) Basic
```

MapPattern returns a copy of a basic query with updated pattern. 

#### <a id="Basic.String" href="#Basic.String">func (b Basic) String() string</a>

```
searchKey: query.Basic.String
tags: [method]
```

```Go
func (b Basic) String() string
```

#### <a id="Basic.ToParseTree" href="#Basic.ToParseTree">func (b Basic) ToParseTree() Q</a>

```
searchKey: query.Basic.ToParseTree
tags: [method]
```

```Go
func (b Basic) ToParseTree() Q
```

#### <a id="Basic.VisitParameter" href="#Basic.VisitParameter">func (b Basic) VisitParameter(field string, f func(value string, negated bool, annotation Annotation))</a>

```
searchKey: query.Basic.VisitParameter
tags: [method]
```

```Go
func (b Basic) VisitParameter(field string, f func(value string, negated bool, annotation Annotation))
```

### <a id="BasicPass" href="#BasicPass">type BasicPass func(github.com/sourcegraph/sourcegraph/internal/search/query.Basic) github.com/sourcegraph/sourcegraph/internal/search/query.Basic</a>

```
searchKey: query.BasicPass
tags: [function]
```

```Go
type BasicPass func(Basic) Basic
```

A BasicPass is a transformation on Basic queries. 

### <a id="ExpectedOperand" href="#ExpectedOperand">type ExpectedOperand struct</a>

```
searchKey: query.ExpectedOperand
tags: [struct]
```

```Go
type ExpectedOperand struct {
	Msg string
}
```

#### <a id="ExpectedOperand.Error" href="#ExpectedOperand.Error">func (e *ExpectedOperand) Error() string</a>

```
searchKey: query.ExpectedOperand.Error
tags: [method]
```

```Go
func (e *ExpectedOperand) Error() string
```

### <a id="FieldMapper" href="#FieldMapper">type FieldMapper struct</a>

```
searchKey: query.FieldMapper
tags: [struct]
```

```Go
type FieldMapper struct {
	BaseMapper
	field    string
	callback func(value string, negated bool) Node
}
```

FieldMapper is a helper mapper that only maps patterns in a query, for a field specified in state. For each parameter with this field name it calls the callback that maps the field's members. 

#### <a id="FieldMapper.MapParameter" href="#FieldMapper.MapParameter">func (s *FieldMapper) MapParameter(mapper Mapper, field, value string, negated bool, annotation Annotation) Node</a>

```
searchKey: query.FieldMapper.MapParameter
tags: [method]
```

```Go
func (s *FieldMapper) MapParameter(mapper Mapper, field, value string, negated bool, annotation Annotation) Node
```

### <a id="FieldVisitor" href="#FieldVisitor">type FieldVisitor struct</a>

```
searchKey: query.FieldVisitor
tags: [struct]
```

```Go
type FieldVisitor struct {
	BaseVisitor
	field    string
	callback func(value string, negated bool, annotation Annotation)
}
```

FieldVisitor is a helper visitor that only visits parameter fields in a query, for a field specified in the state. For each parameter with this field name it calls the callback with the field's members. 

#### <a id="FieldVisitor.VisitParameter" href="#FieldVisitor.VisitParameter">func (s *FieldVisitor) VisitParameter(visitor Visitor, field, value string, negated bool, annotation Annotation)</a>

```
searchKey: query.FieldVisitor.VisitParameter
tags: [method]
```

```Go
func (s *FieldVisitor) VisitParameter(visitor Visitor, field, value string, negated bool, annotation Annotation)
```

### <a id="Mapper" href="#Mapper">type Mapper interface</a>

```
searchKey: query.Mapper
tags: [interface]
```

```Go
type Mapper interface {
	MapNodes(m Mapper, node []Node) []Node
	MapOperator(m Mapper, kind operatorKind, operands []Node) []Node
	MapParameter(m Mapper, field, value string, negated bool, annotation Annotation) Node
	MapPattern(m Mapper, value string, negated bool, annotation Annotation) Node
}
```

The Mapper interface allows to replace nodes for each respective part of the query grammar. It is a visitor that will replace the visited node by the returned value. 

### <a id="Node" href="#Node">type Node interface</a>

```
searchKey: query.Node
tags: [interface]
```

```Go
type Node interface {
	String() string
	node()
}
```

#### <a id="PartitionSearchPattern" href="#PartitionSearchPattern">func PartitionSearchPattern(nodes []Node) (parameters []Parameter, pattern Node, err error)</a>

```
searchKey: query.PartitionSearchPattern
tags: [function]
```

```Go
func PartitionSearchPattern(nodes []Node) (parameters []Parameter, pattern Node, err error)
```

PartitionSearchPattern partitions an and/or query into (1) a single search pattern expression and (2) other parameters that scope the evaluation of search patterns (e.g., to repos, files, etc.). It validates that a query contains at most one search pattern expression and that scope parameters do not contain nested expressions. 

### <a id="Operator" href="#Operator">type Operator struct</a>

```
searchKey: query.Operator
tags: [struct]
```

```Go
type Operator struct {
	Kind       operatorKind
	Operands   []Node
	Annotation Annotation
}
```

Operator is a nonterminal node of kind Kind with child nodes Operands. 

#### <a id="Operator.String" href="#Operator.String">func (node Operator) String() string</a>

```
searchKey: query.Operator.String
tags: [method]
```

```Go
func (node Operator) String() string
```

#### <a id="Operator.node" href="#Operator.node">func (Operator) node()</a>

```
searchKey: query.Operator.node
tags: [method private]
```

```Go
func (Operator) node()
```

### <a id="OperatorMapper" href="#OperatorMapper">type OperatorMapper struct</a>

```
searchKey: query.OperatorMapper
tags: [struct]
```

```Go
type OperatorMapper struct {
	BaseMapper
	callback func(kind operatorKind, operands []Node) []Node
}
```

OperatorMapper is a helper mapper that maps operators in a query. It takes as state a callback that will call and map each visited operator with the return value. 

#### <a id="OperatorMapper.MapOperator" href="#OperatorMapper.MapOperator">func (s *OperatorMapper) MapOperator(mapper Mapper, kind operatorKind, operands []Node) []Node</a>

```
searchKey: query.OperatorMapper.MapOperator
tags: [method]
```

```Go
func (s *OperatorMapper) MapOperator(mapper Mapper, kind operatorKind, operands []Node) []Node
```

MapOperator implements OperatorMapper by overriding the BaseMapper's value to substitute a node computed by the callback. It reduces any substituted node. 

### <a id="OperatorVisitor" href="#OperatorVisitor">type OperatorVisitor struct</a>

```
searchKey: query.OperatorVisitor
tags: [struct]
```

```Go
type OperatorVisitor struct {
	BaseVisitor
	callback func(kind operatorKind, operands []Node)
}
```

ParameterVisitor is a helper visitor that only visits operators in a query, and supplies the operator members via a callback. 

#### <a id="OperatorVisitor.VisitOperator" href="#OperatorVisitor.VisitOperator">func (s *OperatorVisitor) VisitOperator(visitor Visitor, kind operatorKind, operands []Node)</a>

```
searchKey: query.OperatorVisitor.VisitOperator
tags: [method]
```

```Go
func (s *OperatorVisitor) VisitOperator(visitor Visitor, kind operatorKind, operands []Node)
```

### <a id="Parameter" href="#Parameter">type Parameter struct</a>

```
searchKey: query.Parameter
tags: [struct]
```

```Go
type Parameter struct {
	Field      string     `json:"field"`   // The repo part in repo:sourcegraph.
	Value      string     `json:"value"`   // The sourcegraph part in repo:sourcegraph.
	Negated    bool       `json:"negated"` // True if the - prefix exists, as in -repo:sourcegraph.
	Annotation Annotation `json:"-"`
}
```

Parameter is a leaf node of expressions representing a parameter of format "repo:foo". 

#### <a id="Parameter.String" href="#Parameter.String">func (node Parameter) String() string</a>

```
searchKey: query.Parameter.String
tags: [method]
```

```Go
func (node Parameter) String() string
```

#### <a id="Parameter.node" href="#Parameter.node">func (Parameter) node()</a>

```
searchKey: query.Parameter.node
tags: [method private]
```

```Go
func (Parameter) node()
```

### <a id="ParameterMapper" href="#ParameterMapper">type ParameterMapper struct</a>

```
searchKey: query.ParameterMapper
tags: [struct]
```

```Go
type ParameterMapper struct {
	BaseMapper
	callback func(field, value string, negated bool, annotation Annotation) Node
}
```

ParameterMapper is a helper mapper that only maps parameters in a query. It takes as state a callback that will call and map each visited parameter by the return value. 

#### <a id="ParameterMapper.MapParameter" href="#ParameterMapper.MapParameter">func (s *ParameterMapper) MapParameter(mapper Mapper, field, value string, negated bool, annotation Annotation) Node</a>

```
searchKey: query.ParameterMapper.MapParameter
tags: [method]
```

```Go
func (s *ParameterMapper) MapParameter(mapper Mapper, field, value string, negated bool, annotation Annotation) Node
```

MapParameter implements ParameterMapper by overriding the BaseMapper's value to substitute a node computed by the callback. 

### <a id="ParameterVisitor" href="#ParameterVisitor">type ParameterVisitor struct</a>

```
searchKey: query.ParameterVisitor
tags: [struct]
```

```Go
type ParameterVisitor struct {
	BaseVisitor
	callback func(field, value string, negated bool, annotation Annotation)
}
```

ParameterVisitor is a helper visitor that only visits parameters in a query, and supplies the parameter members via a callback. 

#### <a id="ParameterVisitor.VisitParameter" href="#ParameterVisitor.VisitParameter">func (s *ParameterVisitor) VisitParameter(visitor Visitor, field, value string, negated bool, annotation Annotation)</a>

```
searchKey: query.ParameterVisitor.VisitParameter
tags: [method]
```

```Go
func (s *ParameterVisitor) VisitParameter(visitor Visitor, field, value string, negated bool, annotation Annotation)
```

### <a id="Pattern" href="#Pattern">type Pattern struct</a>

```
searchKey: query.Pattern
tags: [struct]
```

```Go
type Pattern struct {
	Value      string     `json:"value"`   // The pattern value.
	Negated    bool       `json:"negated"` // True if this pattern is negated.
	Annotation Annotation `json:"-"`       // An annotation attached to this pattern.
}
```

Pattern is a leaf node of expressions representing a search pattern fragment. 

#### <a id="fuzzyRegexp" href="#fuzzyRegexp">func fuzzyRegexp(patterns []Pattern) Pattern</a>

```
searchKey: query.fuzzyRegexp
tags: [function private]
```

```Go
func fuzzyRegexp(patterns []Pattern) Pattern
```

fuzzyRegexp interpolates patterns with .*? regular expressions and concatenates them. Invariant: len(patterns) > 0. 

#### <a id="newPattern" href="#newPattern">func newPattern(value string, negated bool, labels labels, range_ Range) Pattern</a>

```
searchKey: query.newPattern
tags: [function private]
```

```Go
func newPattern(value string, negated bool, labels labels, range_ Range) Pattern
```

#### <a id="space" href="#space">func space(patterns []Pattern) Pattern</a>

```
searchKey: query.space
tags: [function private]
```

```Go
func space(patterns []Pattern) Pattern
```

fuzzyRegexp interpolates patterns with spaces and concatenates them. Invariant: len(patterns) > 0. 

#### <a id="Pattern.String" href="#Pattern.String">func (node Pattern) String() string</a>

```
searchKey: query.Pattern.String
tags: [method]
```

```Go
func (node Pattern) String() string
```

#### <a id="Pattern.node" href="#Pattern.node">func (Pattern) node()</a>

```
searchKey: query.Pattern.node
tags: [method private]
```

```Go
func (Pattern) node()
```

All terms that implement Node. 

### <a id="PatternMapper" href="#PatternMapper">type PatternMapper struct</a>

```
searchKey: query.PatternMapper
tags: [struct]
```

```Go
type PatternMapper struct {
	BaseMapper
	callback func(value string, negated bool, annotation Annotation) Node
}
```

PatternMapper is a helper mapper that only maps patterns in a query. It takes as state a callback that will call and map each visited pattern by the return value. 

#### <a id="PatternMapper.MapPattern" href="#PatternMapper.MapPattern">func (s *PatternMapper) MapPattern(mapper Mapper, value string, negated bool, annotation Annotation) Node</a>

```
searchKey: query.PatternMapper.MapPattern
tags: [method]
```

```Go
func (s *PatternMapper) MapPattern(mapper Mapper, value string, negated bool, annotation Annotation) Node
```

### <a id="PatternVisitor" href="#PatternVisitor">type PatternVisitor struct</a>

```
searchKey: query.PatternVisitor
tags: [struct]
```

```Go
type PatternVisitor struct {
	BaseVisitor
	callback func(value string, negated bool, annotation Annotation)
}
```

PatternVisitor is a helper visitor that only visits patterns in a query, and supplies the pattern members via a callback. 

#### <a id="PatternVisitor.VisitPattern" href="#PatternVisitor.VisitPattern">func (s *PatternVisitor) VisitPattern(visitor Visitor, value string, negated bool, annotation Annotation)</a>

```
searchKey: query.PatternVisitor.VisitPattern
tags: [method]
```

```Go
func (s *PatternVisitor) VisitPattern(visitor Visitor, value string, negated bool, annotation Annotation)
```

### <a id="Plan" href="#Plan">type Plan []query.Basic</a>

```
searchKey: query.Plan
tags: [array struct]
```

```Go
type Plan []Basic
```

A query plan represents a set of disjoint queries for the search engine to execute. The result of executing a plan is the union of individual query results. 

#### <a id="MapPlan" href="#MapPlan">func MapPlan(plan Plan, pass BasicPass) Plan</a>

```
searchKey: query.MapPlan
tags: [function]
```

```Go
func MapPlan(plan Plan, pass BasicPass) Plan
```

MapPlan applies a conversion to all Basic queries in a plan. It expects a valid plan. guarantee transformation succeeds. 

#### <a id="Pipeline" href="#Pipeline">func Pipeline(steps ...step) (Plan, error)</a>

```
searchKey: query.Pipeline
tags: [function]
```

```Go
func Pipeline(steps ...step) (Plan, error)
```

Pipeline processes zero or more steps to produce a query. The first step must be Init, otherwise this function is a no-op. 

#### <a id="ToPlan" href="#ToPlan">func ToPlan(disjuncts [][]Node) (Plan, error)</a>

```
searchKey: query.ToPlan
tags: [function]
```

```Go
func ToPlan(disjuncts [][]Node) (Plan, error)
```

#### <a id="Plan.ToParseTree" href="#Plan.ToParseTree">func (p Plan) ToParseTree() Q</a>

```
searchKey: query.Plan.ToParseTree
tags: [method]
```

```Go
func (p Plan) ToParseTree() Q
```

ToParseTree models a plan as a parse tree of an Or-expression on plan queries. 

### <a id="Predicate" href="#Predicate">type Predicate interface</a>

```
searchKey: query.Predicate
tags: [interface]
```

```Go
type Predicate interface {
	// Field is the name of the field that the predicate applies to.
	// For example, with `file:contains()`, Field returns "file".
	Field() string

	// Name is the name of the predicate.
	// For example, with `file:contains()`, Name returns "contains".
	Name() string

	// ParseParams parses the contents of the predicate arguments
	// into the predicate object.
	ParseParams(string) error

	// Plan generates a plan of (possibly multiple) queries to execute the
	// behavior of a predicate in a query Q.
	Plan(parent Basic) (Plan, error)
}
```

### <a id="Q" href="#Q">type Q []query.Node</a>

```
searchKey: query.Q
tags: [array interface]
```

```Go
type Q []Node
```

A query is a tree of Nodes. We choose the type name Q so that external uses like query.Q do not stutter. 

#### <a id="ParseLiteral" href="#ParseLiteral">func ParseLiteral(in string) (Q, error)</a>

```
searchKey: query.ParseLiteral
tags: [function]
```

```Go
func ParseLiteral(in string) (Q, error)
```

#### <a id="ParseRegexp" href="#ParseRegexp">func ParseRegexp(in string) (Q, error)</a>

```
searchKey: query.ParseRegexp
tags: [function]
```

```Go
func ParseRegexp(in string) (Q, error)
```

#### <a id="ParseSearchType" href="#ParseSearchType">func ParseSearchType(in string, searchType SearchType) (Q, error)</a>

```
searchKey: query.ParseSearchType
tags: [function]
```

```Go
func ParseSearchType(in string, searchType SearchType) (Q, error)
```

#### <a id="Q.Archived" href="#Q.Archived">func (q Q) Archived() *YesNoOnly</a>

```
searchKey: query.Q.Archived
tags: [method]
```

```Go
func (q Q) Archived() *YesNoOnly
```

#### <a id="Q.BoolValue" href="#Q.BoolValue">func (q Q) BoolValue(field string) bool</a>

```
searchKey: query.Q.BoolValue
tags: [method]
```

```Go
func (q Q) BoolValue(field string) bool
```

#### <a id="Q.Count" href="#Q.Count">func (q Q) Count() *int</a>

```
searchKey: query.Q.Count
tags: [method]
```

```Go
func (q Q) Count() *int
```

#### <a id="Q.Fields" href="#Q.Fields">func (q Q) Fields() map[string][]*Value</a>

```
searchKey: query.Q.Fields
tags: [method]
```

```Go
func (q Q) Fields() map[string][]*Value
```

#### <a id="Q.Fork" href="#Q.Fork">func (q Q) Fork() *YesNoOnly</a>

```
searchKey: query.Q.Fork
tags: [method]
```

```Go
func (q Q) Fork() *YesNoOnly
```

#### <a id="Q.IsCaseSensitive" href="#Q.IsCaseSensitive">func (q Q) IsCaseSensitive() bool</a>

```
searchKey: query.Q.IsCaseSensitive
tags: [method]
```

```Go
func (q Q) IsCaseSensitive() bool
```

#### <a id="Q.RegexpPatterns" href="#Q.RegexpPatterns">func (q Q) RegexpPatterns(field string) (values, negatedValues []string)</a>

```
searchKey: query.Q.RegexpPatterns
tags: [method]
```

```Go
func (q Q) RegexpPatterns(field string) (values, negatedValues []string)
```

#### <a id="Q.Repositories" href="#Q.Repositories">func (q Q) Repositories() (repos []string, negatedRepos []string)</a>

```
searchKey: query.Q.Repositories
tags: [method]
```

```Go
func (q Q) Repositories() (repos []string, negatedRepos []string)
```

#### <a id="Q.String" href="#Q.String">func (q Q) String() string</a>

```
searchKey: query.Q.String
tags: [method]
```

```Go
func (q Q) String() string
```

#### <a id="Q.StringValue" href="#Q.StringValue">func (q Q) StringValue(field string) (value, negatedValue string)</a>

```
searchKey: query.Q.StringValue
tags: [method]
```

```Go
func (q Q) StringValue(field string) (value, negatedValue string)
```

#### <a id="Q.StringValues" href="#Q.StringValues">func (q Q) StringValues(field string) (values, negatedValues []string)</a>

```
searchKey: query.Q.StringValues
tags: [method]
```

```Go
func (q Q) StringValues(field string) (values, negatedValues []string)
```

#### <a id="Q.Timeout" href="#Q.Timeout">func (q Q) Timeout() *time.Duration</a>

```
searchKey: query.Q.Timeout
tags: [method]
```

```Go
func (q Q) Timeout() *time.Duration
```

#### <a id="Q.Values" href="#Q.Values">func (q Q) Values(field string) []*Value</a>

```
searchKey: query.Q.Values
tags: [method]
```

```Go
func (q Q) Values(field string) []*Value
```

#### <a id="Q.valueToTypedValue" href="#Q.valueToTypedValue">func (q Q) valueToTypedValue(field, value string, label labels) []*Value</a>

```
searchKey: query.Q.valueToTypedValue
tags: [method private]
```

```Go
func (q Q) valueToTypedValue(field, value string, label labels) []*Value
```

valueToTypedValue approximately preserves the field validation of our previous query processing. It does not check the validity of field negation or if the same field is specified more than once. This role is now performed by validate.go. 

#### <a id="Q.yesNoOnlyValue" href="#Q.yesNoOnlyValue">func (q Q) yesNoOnlyValue(field string) *YesNoOnly</a>

```
searchKey: query.Q.yesNoOnlyValue
tags: [method private]
```

```Go
func (q Q) yesNoOnlyValue(field string) *YesNoOnly
```

### <a id="QueryInfo" href="#QueryInfo">type QueryInfo interface</a>

```
searchKey: query.QueryInfo
tags: [interface]
```

```Go
type QueryInfo interface {
	Count() *int
	Archived() *YesNoOnly
	Fork() *YesNoOnly
	Timeout() *time.Duration
	Repositories() (repos []string, negated []string)
	RegexpPatterns(field string) (values, negatedValues []string)
	StringValues(field string) (values, negatedValues []string)
	StringValue(field string) (value, negatedValue string)
	Values(field string) []*Value
	Fields() map[string][]*Value
	BoolValue(field string) bool
	IsCaseSensitive() bool
}
```

QueryInfo is an interface for accessing query values that drive our search logic. It will be removed in favor of a cleaner query API to access values. 

### <a id="Range" href="#Range">type Range struct</a>

```
searchKey: query.Range
tags: [struct]
```

```Go
type Range struct {
	Start position `json:"start"`
	End   position `json:"end"`
}
```

#### <a id="newRange" href="#newRange">func newRange(start int, end int) Range</a>

```
searchKey: query.newRange
tags: [function private]
```

```Go
func newRange(start int, end int) Range
```

Returns a new range that assumes the string happens on one line. Column positions are in the interval [start, end]. 

#### <a id="Range.String" href="#Range.String">func (rrange Range) String() string</a>

```
searchKey: query.Range.String
tags: [method]
```

```Go
func (rrange Range) String() string
```

### <a id="RepoContainsCommitAfterPredicate" href="#RepoContainsCommitAfterPredicate">type RepoContainsCommitAfterPredicate struct</a>

```
searchKey: query.RepoContainsCommitAfterPredicate
tags: [struct]
```

```Go
type RepoContainsCommitAfterPredicate struct {
	TimeRef string
}
```

#### <a id="RepoContainsCommitAfterPredicate.Field" href="#RepoContainsCommitAfterPredicate.Field">func (f RepoContainsCommitAfterPredicate) Field() string</a>

```
searchKey: query.RepoContainsCommitAfterPredicate.Field
tags: [method]
```

```Go
func (f RepoContainsCommitAfterPredicate) Field() string
```

#### <a id="RepoContainsCommitAfterPredicate.Name" href="#RepoContainsCommitAfterPredicate.Name">func (f RepoContainsCommitAfterPredicate) Name() string</a>

```
searchKey: query.RepoContainsCommitAfterPredicate.Name
tags: [method]
```

```Go
func (f RepoContainsCommitAfterPredicate) Name() string
```

#### <a id="RepoContainsCommitAfterPredicate.ParseParams" href="#RepoContainsCommitAfterPredicate.ParseParams">func (f *RepoContainsCommitAfterPredicate) ParseParams(params string) error</a>

```
searchKey: query.RepoContainsCommitAfterPredicate.ParseParams
tags: [method]
```

```Go
func (f *RepoContainsCommitAfterPredicate) ParseParams(params string) error
```

#### <a id="RepoContainsCommitAfterPredicate.Plan" href="#RepoContainsCommitAfterPredicate.Plan">func (f *RepoContainsCommitAfterPredicate) Plan(parent Basic) (Plan, error)</a>

```
searchKey: query.RepoContainsCommitAfterPredicate.Plan
tags: [method]
```

```Go
func (f *RepoContainsCommitAfterPredicate) Plan(parent Basic) (Plan, error)
```

### <a id="RepoContainsContentPredicate" href="#RepoContainsContentPredicate">type RepoContainsContentPredicate struct</a>

```
searchKey: query.RepoContainsContentPredicate
tags: [struct]
```

```Go
type RepoContainsContentPredicate struct {
	Pattern string
}
```

#### <a id="RepoContainsContentPredicate.Field" href="#RepoContainsContentPredicate.Field">func (f *RepoContainsContentPredicate) Field() string</a>

```
searchKey: query.RepoContainsContentPredicate.Field
tags: [method]
```

```Go
func (f *RepoContainsContentPredicate) Field() string
```

#### <a id="RepoContainsContentPredicate.Name" href="#RepoContainsContentPredicate.Name">func (f *RepoContainsContentPredicate) Name() string</a>

```
searchKey: query.RepoContainsContentPredicate.Name
tags: [method]
```

```Go
func (f *RepoContainsContentPredicate) Name() string
```

#### <a id="RepoContainsContentPredicate.ParseParams" href="#RepoContainsContentPredicate.ParseParams">func (f *RepoContainsContentPredicate) ParseParams(params string) error</a>

```
searchKey: query.RepoContainsContentPredicate.ParseParams
tags: [method]
```

```Go
func (f *RepoContainsContentPredicate) ParseParams(params string) error
```

#### <a id="RepoContainsContentPredicate.Plan" href="#RepoContainsContentPredicate.Plan">func (f *RepoContainsContentPredicate) Plan(parent Basic) (Plan, error)</a>

```
searchKey: query.RepoContainsContentPredicate.Plan
tags: [method]
```

```Go
func (f *RepoContainsContentPredicate) Plan(parent Basic) (Plan, error)
```

### <a id="RepoContainsFilePredicate" href="#RepoContainsFilePredicate">type RepoContainsFilePredicate struct</a>

```
searchKey: query.RepoContainsFilePredicate
tags: [struct]
```

```Go
type RepoContainsFilePredicate struct {
	Pattern string
}
```

#### <a id="RepoContainsFilePredicate.Field" href="#RepoContainsFilePredicate.Field">func (f *RepoContainsFilePredicate) Field() string</a>

```
searchKey: query.RepoContainsFilePredicate.Field
tags: [method]
```

```Go
func (f *RepoContainsFilePredicate) Field() string
```

#### <a id="RepoContainsFilePredicate.Name" href="#RepoContainsFilePredicate.Name">func (f *RepoContainsFilePredicate) Name() string</a>

```
searchKey: query.RepoContainsFilePredicate.Name
tags: [method]
```

```Go
func (f *RepoContainsFilePredicate) Name() string
```

#### <a id="RepoContainsFilePredicate.ParseParams" href="#RepoContainsFilePredicate.ParseParams">func (f *RepoContainsFilePredicate) ParseParams(params string) error</a>

```
searchKey: query.RepoContainsFilePredicate.ParseParams
tags: [method]
```

```Go
func (f *RepoContainsFilePredicate) ParseParams(params string) error
```

#### <a id="RepoContainsFilePredicate.Plan" href="#RepoContainsFilePredicate.Plan">func (f *RepoContainsFilePredicate) Plan(parent Basic) (Plan, error)</a>

```
searchKey: query.RepoContainsFilePredicate.Plan
tags: [method]
```

```Go
func (f *RepoContainsFilePredicate) Plan(parent Basic) (Plan, error)
```

### <a id="RepoContainsPredicate" href="#RepoContainsPredicate">type RepoContainsPredicate struct</a>

```
searchKey: query.RepoContainsPredicate
tags: [struct]
```

```Go
type RepoContainsPredicate struct {
	File    string
	Content string
}
```

RepoContainsPredicate represents the `repo:contains()` predicate, which filters to repos that contain either a file or content 

#### <a id="RepoContainsPredicate.Field" href="#RepoContainsPredicate.Field">func (f *RepoContainsPredicate) Field() string</a>

```
searchKey: query.RepoContainsPredicate.Field
tags: [method]
```

```Go
func (f *RepoContainsPredicate) Field() string
```

#### <a id="RepoContainsPredicate.Name" href="#RepoContainsPredicate.Name">func (f *RepoContainsPredicate) Name() string</a>

```
searchKey: query.RepoContainsPredicate.Name
tags: [method]
```

```Go
func (f *RepoContainsPredicate) Name() string
```

#### <a id="RepoContainsPredicate.ParseParams" href="#RepoContainsPredicate.ParseParams">func (f *RepoContainsPredicate) ParseParams(params string) error</a>

```
searchKey: query.RepoContainsPredicate.ParseParams
tags: [method]
```

```Go
func (f *RepoContainsPredicate) ParseParams(params string) error
```

#### <a id="RepoContainsPredicate.Plan" href="#RepoContainsPredicate.Plan">func (f *RepoContainsPredicate) Plan(parent Basic) (Plan, error)</a>

```
searchKey: query.RepoContainsPredicate.Plan
tags: [method]
```

```Go
func (f *RepoContainsPredicate) Plan(parent Basic) (Plan, error)
```

#### <a id="RepoContainsPredicate.parseNode" href="#RepoContainsPredicate.parseNode">func (f *RepoContainsPredicate) parseNode(n Node) error</a>

```
searchKey: query.RepoContainsPredicate.parseNode
tags: [method private]
```

```Go
func (f *RepoContainsPredicate) parseNode(n Node) error
```

### <a id="SearchType" href="#SearchType">type SearchType int</a>

```
searchKey: query.SearchType
tags: [number]
```

```Go
type SearchType int
```

#### <a id="SearchType.String" href="#SearchType.String">func (s SearchType) String() string</a>

```
searchKey: query.SearchType.String
tags: [method]
```

```Go
func (s SearchType) String() string
```

### <a id="UnsupportedError" href="#UnsupportedError">type UnsupportedError struct</a>

```
searchKey: query.UnsupportedError
tags: [struct]
```

```Go
type UnsupportedError struct {
	Msg string
}
```

#### <a id="UnsupportedError.Error" href="#UnsupportedError.Error">func (e *UnsupportedError) Error() string</a>

```
searchKey: query.UnsupportedError.Error
tags: [method]
```

```Go
func (e *UnsupportedError) Error() string
```

### <a id="Value" href="#Value">type Value struct</a>

```
searchKey: query.Value
tags: [struct]
```

```Go
type Value struct {
	String *string        // if a string value, the string value (with escape sequences interpreted)
	Regexp *regexp.Regexp // if a regexp pattern, the compiled regular expression (call its String method to get source pattern string)
	Bool   *bool          // if a bool value, the bool value
}
```

A Value is a field value in a query. 

#### <a id="Value.ToString" href="#Value.ToString">func (v *Value) ToString() string</a>

```
searchKey: query.Value.ToString
tags: [method]
```

```Go
func (v *Value) ToString() string
```

#### <a id="Value.Value" href="#Value.Value">func (v *Value) Value() interface{}</a>

```
searchKey: query.Value.Value
tags: [method]
```

```Go
func (v *Value) Value() interface{}
```

Value returns the value as an interface{}. 

### <a id="ValueType" href="#ValueType">type ValueType int</a>

```
searchKey: query.ValueType
tags: [number]
```

```Go
type ValueType int
```

ValueType is the set of types of values in queries. 

### <a id="Visitor" href="#Visitor">type Visitor interface</a>

```
searchKey: query.Visitor
tags: [interface]
```

```Go
type Visitor interface {
	VisitNodes(v Visitor, node []Node)
	VisitOperator(v Visitor, kind operatorKind, operands []Node)
	VisitParameter(v Visitor, field, value string, negated bool, annotation Annotation)
	VisitPattern(v Visitor, value string, negated bool, annotation Annotation)
}
```

The Visitor interface allows to visit nodes for each respective part of the query grammar. 

### <a id="YesNoOnly" href="#YesNoOnly">type YesNoOnly string</a>

```
searchKey: query.YesNoOnly
tags: [string]
```

```Go
type YesNoOnly string
```

#### <a id="ParseYesNoOnly" href="#ParseYesNoOnly">func ParseYesNoOnly(s string) YesNoOnly</a>

```
searchKey: query.ParseYesNoOnly
tags: [function]
```

```Go
func ParseYesNoOnly(s string) YesNoOnly
```

### <a id="globError" href="#globError">type globError struct</a>

```
searchKey: query.globError
tags: [struct private]
```

```Go
type globError struct {
	field string
	err   error
}
```

globError carries the error message and the name of field where the error occurred. 

#### <a id="globError.Error" href="#globError.Error">func (g globError) Error() string</a>

```
searchKey: query.globError.Error
tags: [method private]
```

```Go
func (g globError) Error() string
```

### <a id="heuristics" href="#heuristics">type heuristics uint8</a>

```
searchKey: query.heuristics
tags: [number private]
```

```Go
type heuristics uint8
```

### <a id="keyword" href="#keyword">type keyword string</a>

```
searchKey: query.keyword
tags: [string private]
```

```Go
type keyword string
```

### <a id="labels" href="#labels">type labels uint16</a>

```
searchKey: query.labels
tags: [number private]
```

```Go
type labels uint16
```

Labels are general-purpose annotations that store information about a node. 

#### <a id="collectLabels" href="#collectLabels">func collectLabels(nodes []Node) (result labels)</a>

```
searchKey: query.collectLabels
tags: [function private]
```

```Go
func collectLabels(nodes []Node) (result labels)
```

#### <a id="labels.IsSet" href="#labels.IsSet">func (l *labels) IsSet(label labels) bool</a>

```
searchKey: query.labels.IsSet
tags: [method private]
```

```Go
func (l *labels) IsSet(label labels) bool
```

#### <a id="labels.String" href="#labels.String">func (l *labels) String() []string</a>

```
searchKey: query.labels.String
tags: [method private]
```

```Go
func (l *labels) String() []string
```

#### <a id="labels.set" href="#labels.set">func (l *labels) set(label labels)</a>

```
searchKey: query.labels.set
tags: [method private]
```

```Go
func (l *labels) set(label labels)
```

#### <a id="labels.unset" href="#labels.unset">func (l *labels) unset(label labels)</a>

```
searchKey: query.labels.unset
tags: [method private]
```

```Go
func (l *labels) unset(label labels)
```

### <a id="operatorKind" href="#operatorKind">type operatorKind int</a>

```
searchKey: query.operatorKind
tags: [number private]
```

```Go
type operatorKind int
```

### <a id="parser" href="#parser">type parser struct</a>

```
searchKey: query.parser
tags: [struct private]
```

```Go
type parser struct {
	buf        []byte
	heuristics heuristics
	pos        int
	balanced   int
	leafParser SearchType
}
```

#### <a id="parser.ParseFieldValue" href="#parser.ParseFieldValue">func (p *parser) ParseFieldValue(field string) (string, labels, error)</a>

```
searchKey: query.parser.ParseFieldValue
tags: [method private]
```

```Go
func (p *parser) ParseFieldValue(field string) (string, labels, error)
```

ParseFieldValue parses a value after a field like "repo:". It returns the parsed value and any labels to annotate this value with. If the value starts with a recognized quoting delimiter but does not close it, an error is returned. 

#### <a id="parser.ParseParameter" href="#parser.ParseParameter">func (p *parser) ParseParameter() (Parameter, bool, error)</a>

```
searchKey: query.parser.ParseParameter
tags: [method private]
```

```Go
func (p *parser) ParseParameter() (Parameter, bool, error)
```

ParseParameter returns a leaf node corresponding to the syntax (-?)field:<string> where : matches the first encountered colon, and field must match ^[a-zA-Z]+ and be allowed by allFields. Field may optionally be preceded by '-' which means the parameter is negated. 

#### <a id="parser.ParsePattern" href="#parser.ParsePattern">func (p *parser) ParsePattern(label labels) Pattern</a>

```
searchKey: query.parser.ParsePattern
tags: [method private]
```

```Go
func (p *parser) ParsePattern(label labels) Pattern
```

ParsePattern parses a leaf node Pattern that corresponds to a search pattern. Note that ParsePattern may be called multiple times (a query can have multiple Patterns concatenated together). 

#### <a id="parser.TryParseDelimitedPattern" href="#parser.TryParseDelimitedPattern">func (p *parser) TryParseDelimitedPattern() (Pattern, bool)</a>

```
searchKey: query.parser.TryParseDelimitedPattern
tags: [method private]
```

```Go
func (p *parser) TryParseDelimitedPattern() (Pattern, bool)
```

Try parse a delimited pattern, quoted as "...", '...', or /.../. 

#### <a id="parser.TryParseDelimiter" href="#parser.TryParseDelimiter">func (p *parser) TryParseDelimiter() (string, rune, bool)</a>

```
searchKey: query.parser.TryParseDelimiter
tags: [method private]
```

```Go
func (p *parser) TryParseDelimiter() (string, rune, bool)
```

TryParseDelimiter tries to parse a delimited string, returning the interpreted (i.e., unquoted) value if it succeeds, the delimiter that suceeded parsing, and whether it succeeded. 

#### <a id="parser.TryScanBalancedPattern" href="#parser.TryScanBalancedPattern">func (p *parser) TryScanBalancedPattern(label labels) (Pattern, bool)</a>

```
searchKey: query.parser.TryScanBalancedPattern
tags: [method private]
```

```Go
func (p *parser) TryScanBalancedPattern(label labels) (Pattern, bool)
```

#### <a id="parser.done" href="#parser.done">func (p *parser) done() bool</a>

```
searchKey: query.parser.done
tags: [method private]
```

```Go
func (p *parser) done() bool
```

#### <a id="parser.expect" href="#parser.expect">func (p *parser) expect(keyword keyword) bool</a>

```
searchKey: query.parser.expect
tags: [method private]
```

```Go
func (p *parser) expect(keyword keyword) bool
```

expect returns the result of match, and advances the position if it succeeds. 

#### <a id="parser.match" href="#parser.match">func (p *parser) match(keyword keyword) bool</a>

```
searchKey: query.parser.match
tags: [method private]
```

```Go
func (p *parser) match(keyword keyword) bool
```

match returns whether it succeeded matching a keyword at the current position. It does not advance the position. 

#### <a id="parser.matchKeyword" href="#parser.matchKeyword">func (p *parser) matchKeyword(keyword keyword) bool</a>

```
searchKey: query.parser.matchKeyword
tags: [method private]
```

```Go
func (p *parser) matchKeyword(keyword keyword) bool
```

matchKeyword is like match but expects the keyword to be preceded and followed by whitespace. 

#### <a id="parser.matchUnaryKeyword" href="#parser.matchUnaryKeyword">func (p *parser) matchUnaryKeyword(keyword keyword) bool</a>

```
searchKey: query.parser.matchUnaryKeyword
tags: [method private]
```

```Go
func (p *parser) matchUnaryKeyword(keyword keyword) bool
```

matchUnaryKeyword is like match but expects the keyword to be followed by whitespace. 

#### <a id="parser.next" href="#parser.next">func (p *parser) next() rune</a>

```
searchKey: query.parser.next
tags: [method private]
```

```Go
func (p *parser) next() rune
```

#### <a id="parser.parseAnd" href="#parser.parseAnd">func (p *parser) parseAnd() ([]Node, error)</a>

```
searchKey: query.parser.parseAnd
tags: [method private]
```

```Go
func (p *parser) parseAnd() ([]Node, error)
```

parseAnd parses and-expressions. 

#### <a id="parser.parseLeaves" href="#parser.parseLeaves">func (p *parser) parseLeaves(label labels) ([]Node, error)</a>

```
searchKey: query.parser.parseLeaves
tags: [method private]
```

```Go
func (p *parser) parseLeaves(label labels) ([]Node, error)
```

parseLeaves scans for consecutive leaf nodes and applies label to patterns. 

#### <a id="parser.parseOr" href="#parser.parseOr">func (p *parser) parseOr() ([]Node, error)</a>

```
searchKey: query.parser.parseOr
tags: [method private]
```

```Go
func (p *parser) parseOr() ([]Node, error)
```

parseOr parses or-expressions. Or operators have lower precedence than And operators, therefore this function calls parseAnd. 

#### <a id="parser.peek" href="#parser.peek">func (p *parser) peek(n int) (string, error)</a>

```
searchKey: query.parser.peek
tags: [method private]
```

```Go
func (p *parser) peek(n int) (string, error)
```

peek looks ahead n runes in the input and returns a string if it succeeds, or an error if the length exceeds what's available in the buffer. 

#### <a id="parser.skipSpaces" href="#parser.skipSpaces">func (p *parser) skipSpaces() error</a>

```
searchKey: query.parser.skipSpaces
tags: [method private]
```

```Go
func (p *parser) skipSpaces() error
```

skipSpaces advances the input and places the parser position at the next non-space value. 

#### <a id="parser.tryFallbackParser" href="#parser.tryFallbackParser">func (p *parser) tryFallbackParser(in string) ([]Node, error)</a>

```
searchKey: query.parser.tryFallbackParser
tags: [method private]
```

```Go
func (p *parser) tryFallbackParser(in string) ([]Node, error)
```

### <a id="pass" href="#pass">type pass func(nodes []github.com/sourcegraph/sourcegraph/internal/search/query.Node) []github.com/sourcegraph/sourcegraph/internal/search/query.Node</a>

```
searchKey: query.pass
tags: [function private]
```

```Go
type pass func(nodes []Node) []Node
```

A pass is a step that never fails. 

### <a id="position" href="#position">type position struct</a>

```
searchKey: query.position
tags: [struct private]
```

```Go
type position struct {
	Line   int `json:"line"`
	Column int `json:"column"`
}
```

### <a id="predicateRegistry" href="#predicateRegistry">type predicateRegistry map[string]map[string]func() github.com/sourcegraph/sourcegraph/internal/search/query.Predicate</a>

```
searchKey: query.predicateRegistry
tags: [object private]
```

```Go
type predicateRegistry map[string]map[string]func() Predicate
```

#### <a id="predicateRegistry.Get" href="#predicateRegistry.Get">func (pr predicateRegistry) Get(field, name string) Predicate</a>

```
searchKey: query.predicateRegistry.Get
tags: [method private]
```

```Go
func (pr predicateRegistry) Get(field, name string) Predicate
```

Get returns a predicate for the given field with the given name. It assumes it exists, and panics otherwise. 

### <a id="repoVisibility" href="#repoVisibility">type repoVisibility string</a>

```
searchKey: query.repoVisibility
tags: [string private]
```

```Go
type repoVisibility string
```

#### <a id="ParseVisibility" href="#ParseVisibility">func ParseVisibility(s string) repoVisibility</a>

```
searchKey: query.ParseVisibility
tags: [function]
```

```Go
func ParseVisibility(s string) repoVisibility
```

### <a id="step" href="#step">type step func(nodes []github.com/sourcegraph/sourcegraph/internal/search/query.Node) ([]github.com/sourcegraph/sourcegraph/internal/search/query.Node, error)</a>

```
searchKey: query.step
tags: [function private]
```

```Go
type step func(nodes []Node) ([]Node, error)
```

A step performs a transformation on nodes, which may fail. 

#### <a id="For" href="#For">func For(searchType SearchType) step</a>

```
searchKey: query.For
tags: [function]
```

```Go
func For(searchType SearchType) step
```

For runs processing steps for a given search type. This includes normalization, substitution for whitespace, and pattern labeling. 

#### <a id="Init" href="#Init">func Init(in string, searchType SearchType) step</a>

```
searchKey: query.Init
tags: [function]
```

```Go
func Init(in string, searchType SearchType) step
```

Init creates a step from an input string and search type. It parses the initial input string. 

#### <a id="InitLiteral" href="#InitLiteral">func InitLiteral(in string) step</a>

```
searchKey: query.InitLiteral
tags: [function]
```

```Go
func InitLiteral(in string) step
```

InitLiteral is Init where SearchType is Literal. 

#### <a id="InitRegexp" href="#InitRegexp">func InitRegexp(in string) step</a>

```
searchKey: query.InitRegexp
tags: [function]
```

```Go
func InitRegexp(in string) step
```

InitRegexp is Init where SearchType is Regex. 

#### <a id="InitStructural" href="#InitStructural">func InitStructural(in string) step</a>

```
searchKey: query.InitStructural
tags: [function]
```

```Go
func InitStructural(in string) step
```

InitStructural is Init where SearchType is Structural. 

#### <a id="With" href="#With">func With(enabled bool, step step) step</a>

```
searchKey: query.With
tags: [function]
```

```Go
func With(enabled bool, step step) step
```

With returns step if enabled is true. Use it to compose a pipeline that conditionally run steps. 

#### <a id="sequence" href="#sequence">func sequence(steps ...step) step</a>

```
searchKey: query.sequence
tags: [function private]
```

```Go
func sequence(steps ...step) step
```

sequence sequences zero or more steps to create a single step. 

#### <a id="succeeds" href="#succeeds">func succeeds(passes ...pass) step</a>

```
searchKey: query.succeeds
tags: [function private]
```

```Go
func succeeds(passes ...pass) step
```

succeeds converts a sequence of passes into a single step. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="AddRegexpField" href="#AddRegexpField">func AddRegexpField(q Q, field, pattern string) string</a>

```
searchKey: query.AddRegexpField
tags: [function]
```

```Go
func AddRegexpField(q Q, field, pattern string) string
```

addRegexpField adds a new expr to the query with the given field and pattern value. The nonnegated field is assumed to associate with a regexp value. The pattern value is assumed to be unquoted. 

It tries to remove redundancy in the result. For example, given a query like "x:foo", if given a field "x" with pattern "foobar" to add, it will return a query "x:foobar" instead of "x:foo x:foobar". It is not guaranteed to always return the simplest query. 

### <a id="ContainsNoGlobSyntax" href="#ContainsNoGlobSyntax">func ContainsNoGlobSyntax(value string) bool</a>

```
searchKey: query.ContainsNoGlobSyntax
tags: [function]
```

```Go
func ContainsNoGlobSyntax(value string) bool
```

### <a id="ContainsRefGlobs" href="#ContainsRefGlobs">func ContainsRefGlobs(q Q) bool</a>

```
searchKey: query.ContainsRefGlobs
tags: [function]
```

```Go
func ContainsRefGlobs(q Q) bool
```

### <a id="ContainsRegexpMetasyntax" href="#ContainsRegexpMetasyntax">func ContainsRegexpMetasyntax(input string) bool</a>

```
searchKey: query.ContainsRegexpMetasyntax
tags: [function]
```

```Go
func ContainsRegexpMetasyntax(input string) bool
```

ContainsRegexpMetasyntax returns true if a string is a valid regular expression and contains regex metasyntax (i.e., it is not a literal). 

### <a id="Dnf" href="#Dnf">func Dnf(query []Node) [][]Node</a>

```
searchKey: query.Dnf
tags: [function]
```

```Go
func Dnf(query []Node) [][]Node
```

Dnf returns the Disjunctive Normal Form of a query (a flat sequence of or-expressions) by applying the distributive property on (possibly nested) or-expressions. For example, the query: 

(repo:a (file:b OR file:c)) in DNF becomes: (repo:a file:b) OR (repo:a file:c) 

Using the DNF expression makes it easy to support general nested queries that imply scope, like the one above: We simply evaluate all disjuncts and union the results. Note that various optimizations are possible during evaluation, but those are separate query pre- or postprocessing steps separate from this general transformation. 

### <a id="FuzzifyRegexPatterns" href="#FuzzifyRegexPatterns">func FuzzifyRegexPatterns(nodes []Node) []Node</a>

```
searchKey: query.FuzzifyRegexPatterns
tags: [function]
```

```Go
func FuzzifyRegexPatterns(nodes []Node) []Node
```

### <a id="Globbing" href="#Globbing">func Globbing(nodes []Node) ([]Node, error)</a>

```
searchKey: query.Globbing
tags: [function]
```

```Go
func Globbing(nodes []Node) ([]Node, error)
```

Globbing translates glob to regexp for fields repo, file, and repohasfile. 

### <a id="HasTypeRepo" href="#HasTypeRepo">func HasTypeRepo(q Q) bool</a>

```
searchKey: query.HasTypeRepo
tags: [function]
```

```Go
func HasTypeRepo(q Q) bool
```

### <a id="Hoist" href="#Hoist">func Hoist(nodes []Node) ([]Node, error)</a>

```
searchKey: query.Hoist
tags: [function]
```

```Go
func Hoist(nodes []Node) ([]Node, error)
```

Hoist is a heuristic that rewrites simple but possibly ambiguous queries. It changes certain expressions in a way that some consider to be more natural. For example, the following query without parentheses is interpreted as follows in the grammar: 

repo:foo a or b and c => (repo:foo a) or ((b) and (c)) 

This function rewrites the above expression as follows: 

repo:foo a or b and c => repo:foo (a or b and c) 

Any number of field:value parameters may occur before and after the pattern expression separated by or- or and-operators, and these are hoisted out. The pattern expression must be contiguous. If not, we want to preserve the default interpretation, which corresponds more naturally to groupings with field parameters, i.e., 

repo:foo a or b or repo:bar c => (repo:foo a) or (b) or (repo:bar c) 

### <a id="IsBasic" href="#IsBasic">func IsBasic(nodes []Node) bool</a>

```
searchKey: query.IsBasic
tags: [function]
```

```Go
func IsBasic(nodes []Node) bool
```

IsBasic returns whether a query is a basic query. A basic query is one which does not have a DNF-expansion. I.e., there is only one disjunct. A basic query implies that it has no subexpressions that we need to evaluate. IsBasic is used in our codebase where legacy code has not been updated to handle queries with multiple expressions (like alerts), and assume only one evaluatable query. 

### <a id="IsPatternAtom" href="#IsPatternAtom">func IsPatternAtom(b Basic) bool</a>

```
searchKey: query.IsPatternAtom
tags: [function]
```

```Go
func IsPatternAtom(b Basic) bool
```

IsPatternAtom returns whether a node is a non-negated pattern atom. 

### <a id="IsStreamingCompatible" href="#IsStreamingCompatible">func IsStreamingCompatible(p Plan) bool</a>

```
searchKey: query.IsStreamingCompatible
tags: [function]
```

```Go
func IsStreamingCompatible(p Plan) bool
```

IsStreamingCompatible returns whether a backend search process may immediately send results over a streaming interface. A query is streaming compatible if a streaming search engine component (like git-powered commit search or Zoekt) may assume that it's processing just one logical search expression which is not subject to additional merge/deduplication processing, which are otherwise required by `and` and `or` expressions in the Sourcegraph query evaluation routine. A single logical search expression is represented by a single Basic query which contains either no pattern node, or a single pattern node. 

### <a id="LooksLikeGitHubRepo" href="#LooksLikeGitHubRepo">func LooksLikeGitHubRepo(value string) bool</a>

```
searchKey: query.LooksLikeGitHubRepo
tags: [function]
```

```Go
func LooksLikeGitHubRepo(value string) bool
```

LooksLikeGitHubRepo returns whether string value looks like a valid GitHub repo path. This condition is used to guess whether we should make a pattern fuzzy, or try it as an exact match. 

### <a id="LowercaseFieldNames" href="#LowercaseFieldNames">func LowercaseFieldNames(nodes []Node) []Node</a>

```
searchKey: query.LowercaseFieldNames
tags: [function]
```

```Go
func LowercaseFieldNames(nodes []Node) []Node
```

LowercaseFieldNames performs strings.ToLower on every field name. 

### <a id="Map" href="#Map">func Map(query []Node, fns ...func([]Node) []Node) []Node</a>

```
searchKey: query.Map
tags: [function]
```

```Go
func Map(query []Node, fns ...func([]Node) []Node) []Node
```

Map pipes query through one or more query transformer functions. 

### <a id="MapField" href="#MapField">func MapField(nodes []Node, field string, callback func(value string, negated bool) Node) []Node</a>

```
searchKey: query.MapField
tags: [function]
```

```Go
func MapField(nodes []Node, field string, callback func(value string, negated bool) Node) []Node
```

MapField is a convenience function that calls callback on all parameter nodes whose field matches the field argument, substituting them for callback's return value. callback supplies the node's value, and whether the value is negated. 

### <a id="MapOperator" href="#MapOperator">func MapOperator(nodes []Node, callback func(kind operatorKind, operands []Node) []Node) []Node</a>

```
searchKey: query.MapOperator
tags: [function]
```

```Go
func MapOperator(nodes []Node, callback func(kind operatorKind, operands []Node) []Node) []Node
```

MapOperator is a convenience function that calls callback on all operator nodes, substituting them for callback's return value. callback supplies the node's kind and operands. 

### <a id="MapParameter" href="#MapParameter">func MapParameter(nodes []Node, callback func(field, value string, negated bool, annotation Annotation) Node) []Node</a>

```
searchKey: query.MapParameter
tags: [function]
```

```Go
func MapParameter(nodes []Node, callback func(field, value string, negated bool, annotation Annotation) Node) []Node
```

MapParameter is a convenience function that calls callback on all parameter nodes, substituting them for callback's return value. callback supplies the node's field, value, and whether the value is negated. 

### <a id="MapPattern" href="#MapPattern">func MapPattern(nodes []Node, callback func(value string, negated bool, annotation Annotation) Node) []Node</a>

```
searchKey: query.MapPattern
tags: [function]
```

```Go
func MapPattern(nodes []Node, callback func(value string, negated bool, annotation Annotation) Node) []Node
```

MapPattern is a convenience function that calls callback on all pattern nodes, substituting them for callback's return value. callback supplies the node's field, value, and whether the value is negated. 

### <a id="OmitField" href="#OmitField">func OmitField(q Q, field string) string</a>

```
searchKey: query.OmitField
tags: [function]
```

```Go
func OmitField(q Q, field string) string
```

OmitField removes all fields `field` from a query. The `field` string should be the canonical name and not an alias ("repo", not "r"). 

### <a id="OverrideField" href="#OverrideField">func OverrideField(nodes []Node, field, value string) []Node</a>

```
searchKey: query.OverrideField
tags: [function]
```

```Go
func OverrideField(nodes []Node, field, value string) []Node
```

### <a id="Parse" href="#Parse">func Parse(in string, searchType SearchType) ([]Node, error)</a>

```
searchKey: query.Parse
tags: [function]
```

```Go
func Parse(in string, searchType SearchType) ([]Node, error)
```

Parse parses a raw input string into a parse tree comprising Nodes. 

### <a id="ParseAsPredicate" href="#ParseAsPredicate">func ParseAsPredicate(value string) (name, params string)</a>

```
searchKey: query.ParseAsPredicate
tags: [function]
```

```Go
func ParseAsPredicate(value string) (name, params string)
```

ParsePredicate returns the name and value of syntax conforming to name(value). It assumes this syntax is already validated prior. If not, it panics. 

### <a id="Run" href="#Run">func Run(step step) ([]Node, error)</a>

```
searchKey: query.Run
tags: [function]
```

```Go
func Run(step step) ([]Node, error)
```

### <a id="ScanAnyPattern" href="#ScanAnyPattern">func ScanAnyPattern(buf []byte) (scanned string, count int)</a>

```
searchKey: query.ScanAnyPattern
tags: [function]
```

```Go
func ScanAnyPattern(buf []byte) (scanned string, count int)
```

ScanAnyPattern consumes all characters up to a whitespace character and returns the string and how much it consumed. 

### <a id="ScanBalancedParens" href="#ScanBalancedParens">func ScanBalancedParens(buf []byte) (string, int, bool)</a>

```
searchKey: query.ScanBalancedParens
tags: [function]
```

```Go
func ScanBalancedParens(buf []byte) (string, int, bool)
```

ScanBalancedParens will return the full string including and inside the parantheses that start with the first character. This is different from ScanBalancedPattern because that attempts to take into account whether the content looks like other filters. In the case of predicates, we offload the job of parsing parameters onto the predicates themselves, so we just want the full content of the parameters, whatever it contains. 

### <a id="ScanBalancedPattern" href="#ScanBalancedPattern">func ScanBalancedPattern(buf []byte) (scanned string, count int, ok bool)</a>

```
searchKey: query.ScanBalancedPattern
tags: [function]
```

```Go
func ScanBalancedPattern(buf []byte) (scanned string, count int, ok bool)
```

ScanBalancedPattern attempts to scan parentheses as literal patterns. This ensures that we interpret patterns containing parentheses _as patterns_ and not groups. For example, it accepts these patterns: 

((a|b)|c)              - a regular expression with balanced parentheses for grouping myFunction(arg1, arg2) - a literal string with parens that should be literally interpreted foo(...)               - a structural search pattern 

If it weren't for this scanner, the above parentheses would have to be interpreted as part of the query language group syntax, like these: 

(foo or (bar and baz)) 

So, this scanner detects parentheses as patterns without needing the user to explicitly escape them. As such, there are cases where this scanner should not succeed: 

(foo or (bar and baz)) - a valid query with and/or expression groups in the query langugae (repo:foo bar baz)     - a valid query containing a recognized repo: field. Here parentheses are interpreted as a group, not a pattern. 

### <a id="ScanDelimited" href="#ScanDelimited">func ScanDelimited(buf []byte, strict bool, delimiter rune) (string, int, error)</a>

```
searchKey: query.ScanDelimited
tags: [function]
```

```Go
func ScanDelimited(buf []byte, strict bool, delimiter rune) (string, int, error)
```

ScanDelimited takes a delimited (e.g., quoted) value for some arbitrary delimiter, returning the undelimited value, and the end position of the original delimited value (i.e., including quotes). `\` is treated as an escape character for the delimiter and traditional string escape sequences. The `strict` input parameter sets whether this delimiter may contain only recognized escaped characters (strict), or arbitrary ones. The input buffer must start with the chosen delimiter. 

### <a id="ScanField" href="#ScanField">func ScanField(buf []byte) (string, bool, int)</a>

```
searchKey: query.ScanField
tags: [function]
```

```Go
func ScanField(buf []byte) (string, bool, int)
```

ScanField scans an optional '-' at the beginning of a string, and then scans one or more alphabetic characters until it encounters a ':'. The prefix string is checked against valid fields. If it is valid, the function returns the value before the colon, whether it's negated, and its length. In all other cases it returns zero values. 

### <a id="ScanPredicate" href="#ScanPredicate">func ScanPredicate(field string, buf []byte) (string, int, bool)</a>

```
searchKey: query.ScanPredicate
tags: [function]
```

```Go
func ScanPredicate(field string, buf []byte) (string, int, bool)
```

ScanPredicate scans for a predicate that exists in the predicate registry. It takes the current field as context. 

### <a id="ScanPredicateName" href="#ScanPredicateName">func ScanPredicateName(fieldRegistry map[string]func() Predicate, buf []byte) (string, int, bool)</a>

```
searchKey: query.ScanPredicateName
tags: [function]
```

```Go
func ScanPredicateName(fieldRegistry map[string]func() Predicate, buf []byte) (string, int, bool)
```

ScanPredicateName scans for a well-known predicate name for he given field 

### <a id="ScanValue" href="#ScanValue">func ScanValue(buf []byte, allowDanglingParens bool) (string, int)</a>

```
searchKey: query.ScanValue
tags: [function]
```

```Go
func ScanValue(buf []byte, allowDanglingParens bool) (string, int)
```

ScanValue scans for a value (e.g., of a parameter, or a string corresponding to a search pattern). Its main function is to determine when to stop scanning a value (e.g., at a parentheses), and which escape sequences to interpret. It returns the scanned value, how much was advanced, and whether to allow scanning dangling parentheses in patterns like "foo(". 

### <a id="StringHuman" href="#StringHuman">func StringHuman(nodes []Node) string</a>

```
searchKey: query.StringHuman
tags: [function]
```

```Go
func StringHuman(nodes []Node) string
```

StringHuman creates a valid query string from a parsed query. It is used in contexts like query suggestions where we take the original query string of a user, parse it to a tree, modify the tree, and return a valid string representation. To faithfully preserve the meaning of the original tree, we need to consider whether to add operators like "and" contextually and must process the tree as a whole: 

repo:foo file:bar a and b -> preserve 'and', but do not insert 'and' between 'repo:foo file:bar'. repo:foo file:bar a b     -> do not insert any 'and', especially not between 'a b'. 

It strives to be syntax preserving, but may in some cases affect whitespace, operator capitalization, or parenthesized groupings. In very complex queries, additional 'and' operators may be inserted to segment parameters from patterns to preserve the original meaning. 

### <a id="SubstituteAliases" href="#SubstituteAliases">func SubstituteAliases(searchType SearchType) func(nodes []Node) []Node</a>

```
searchKey: query.SubstituteAliases
tags: [function]
```

```Go
func SubstituteAliases(searchType SearchType) func(nodes []Node) []Node
```

SubstituteAliases substitutes field name aliases for their canonical names, and substitutes `content:` for pattern nodes. 

### <a id="SubstituteCountAll" href="#SubstituteCountAll">func SubstituteCountAll(nodes []Node) []Node</a>

```
searchKey: query.SubstituteCountAll
tags: [function]
```

```Go
func SubstituteCountAll(nodes []Node) []Node
```

SubstituteCountAll replaces count:all with count:99999999. 

### <a id="TestAndOrQuery_IsCaseSensitive" href="#TestAndOrQuery_IsCaseSensitive">func TestAndOrQuery_IsCaseSensitive(t *testing.T)</a>

```
searchKey: query.TestAndOrQuery_IsCaseSensitive
tags: [function private test]
```

```Go
func TestAndOrQuery_IsCaseSensitive(t *testing.T)
```

### <a id="TestAndOrQuery_RegexpPatterns" href="#TestAndOrQuery_RegexpPatterns">func TestAndOrQuery_RegexpPatterns(t *testing.T)</a>

```
searchKey: query.TestAndOrQuery_RegexpPatterns
tags: [function private test]
```

```Go
func TestAndOrQuery_RegexpPatterns(t *testing.T)
```

### <a id="TestAndOrQuery_Validation" href="#TestAndOrQuery_Validation">func TestAndOrQuery_Validation(t *testing.T)</a>

```
searchKey: query.TestAndOrQuery_Validation
tags: [function private test]
```

```Go
func TestAndOrQuery_Validation(t *testing.T)
```

### <a id="TestConcatRevFilters" href="#TestConcatRevFilters">func TestConcatRevFilters(t *testing.T)</a>

```
searchKey: query.TestConcatRevFilters
tags: [function private test]
```

```Go
func TestConcatRevFilters(t *testing.T)
```

### <a id="TestConcatRevFiltersTopLevelAnd" href="#TestConcatRevFiltersTopLevelAnd">func TestConcatRevFiltersTopLevelAnd(t *testing.T)</a>

```
searchKey: query.TestConcatRevFiltersTopLevelAnd
tags: [function private test]
```

```Go
func TestConcatRevFiltersTopLevelAnd(t *testing.T)
```

### <a id="TestContainsNoGlobSyntax" href="#TestContainsNoGlobSyntax">func TestContainsNoGlobSyntax(t *testing.T)</a>

```
searchKey: query.TestContainsNoGlobSyntax
tags: [function private test]
```

```Go
func TestContainsNoGlobSyntax(t *testing.T)
```

### <a id="TestContainsRefGlobs" href="#TestContainsRefGlobs">func TestContainsRefGlobs(t *testing.T)</a>

```
searchKey: query.TestContainsRefGlobs
tags: [function private test]
```

```Go
func TestContainsRefGlobs(t *testing.T)
```

### <a id="TestConvertEmptyGroupsToLiteral" href="#TestConvertEmptyGroupsToLiteral">func TestConvertEmptyGroupsToLiteral(t *testing.T)</a>

```
searchKey: query.TestConvertEmptyGroupsToLiteral
tags: [function private test]
```

```Go
func TestConvertEmptyGroupsToLiteral(t *testing.T)
```

### <a id="TestEllipsesForHoles" href="#TestEllipsesForHoles">func TestEllipsesForHoles(t *testing.T)</a>

```
searchKey: query.TestEllipsesForHoles
tags: [function private test]
```

```Go
func TestEllipsesForHoles(t *testing.T)
```

### <a id="TestExpandOr" href="#TestExpandOr">func TestExpandOr(t *testing.T)</a>

```
searchKey: query.TestExpandOr
tags: [function private test]
```

```Go
func TestExpandOr(t *testing.T)
```

### <a id="TestForAll" href="#TestForAll">func TestForAll(t *testing.T)</a>

```
searchKey: query.TestForAll
tags: [function private test]
```

```Go
func TestForAll(t *testing.T)
```

### <a id="TestFuzzifyGlobPattern" href="#TestFuzzifyGlobPattern">func TestFuzzifyGlobPattern(t *testing.T)</a>

```
searchKey: query.TestFuzzifyGlobPattern
tags: [function private test]
```

```Go
func TestFuzzifyGlobPattern(t *testing.T)
```

### <a id="TestFuzzifyRegexPatterns" href="#TestFuzzifyRegexPatterns">func TestFuzzifyRegexPatterns(t *testing.T)</a>

```
searchKey: query.TestFuzzifyRegexPatterns
tags: [function private test]
```

```Go
func TestFuzzifyRegexPatterns(t *testing.T)
```

### <a id="TestHasTypeRepo" href="#TestHasTypeRepo">func TestHasTypeRepo(t *testing.T)</a>

```
searchKey: query.TestHasTypeRepo
tags: [function private test]
```

```Go
func TestHasTypeRepo(t *testing.T)
```

### <a id="TestHoist" href="#TestHoist">func TestHoist(t *testing.T)</a>

```
searchKey: query.TestHoist
tags: [function private test]
```

```Go
func TestHoist(t *testing.T)
```

### <a id="TestLowercaseFieldNames" href="#TestLowercaseFieldNames">func TestLowercaseFieldNames(t *testing.T)</a>

```
searchKey: query.TestLowercaseFieldNames
tags: [function private test]
```

```Go
func TestLowercaseFieldNames(t *testing.T)
```

### <a id="TestMap" href="#TestMap">func TestMap(t *testing.T)</a>

```
searchKey: query.TestMap
tags: [function private test]
```

```Go
func TestMap(t *testing.T)
```

### <a id="TestMapField" href="#TestMapField">func TestMapField(t *testing.T)</a>

```
searchKey: query.TestMapField
tags: [function private test]
```

```Go
func TestMapField(t *testing.T)
```

### <a id="TestMapGlobToRegex" href="#TestMapGlobToRegex">func TestMapGlobToRegex(t *testing.T)</a>

```
searchKey: query.TestMapGlobToRegex
tags: [function private test]
```

```Go
func TestMapGlobToRegex(t *testing.T)
```

### <a id="TestMapOperator" href="#TestMapOperator">func TestMapOperator(t *testing.T)</a>

```
searchKey: query.TestMapOperator
tags: [function private test]
```

```Go
func TestMapOperator(t *testing.T)
```

### <a id="TestMatchUnaryKeyword" href="#TestMatchUnaryKeyword">func TestMatchUnaryKeyword(t *testing.T)</a>

```
searchKey: query.TestMatchUnaryKeyword
tags: [function private test]
```

```Go
func TestMatchUnaryKeyword(t *testing.T)
```

### <a id="TestMergePatterns" href="#TestMergePatterns">func TestMergePatterns(t *testing.T)</a>

```
searchKey: query.TestMergePatterns
tags: [function private test]
```

```Go
func TestMergePatterns(t *testing.T)
```

### <a id="TestParse" href="#TestParse">func TestParse(t *testing.T)</a>

```
searchKey: query.TestParse
tags: [function private test]
```

```Go
func TestParse(t *testing.T)
```

### <a id="TestParseAndOrLiteral" href="#TestParseAndOrLiteral">func TestParseAndOrLiteral(t *testing.T)</a>

```
searchKey: query.TestParseAndOrLiteral
tags: [function private test]
```

```Go
func TestParseAndOrLiteral(t *testing.T)
```

### <a id="TestParseAsPredicate" href="#TestParseAsPredicate">func TestParseAsPredicate(t *testing.T)</a>

```
searchKey: query.TestParseAsPredicate
tags: [function private test]
```

```Go
func TestParseAsPredicate(t *testing.T)
```

### <a id="TestParseParameterList" href="#TestParseParameterList">func TestParseParameterList(t *testing.T)</a>

```
searchKey: query.TestParseParameterList
tags: [function private test]
```

```Go
func TestParseParameterList(t *testing.T)
```

### <a id="TestPartitionSearchPattern" href="#TestPartitionSearchPattern">func TestPartitionSearchPattern(t *testing.T)</a>

```
searchKey: query.TestPartitionSearchPattern
tags: [function private test]
```

```Go
func TestPartitionSearchPattern(t *testing.T)
```

### <a id="TestPipeline" href="#TestPipeline">func TestPipeline(t *testing.T)</a>

```
searchKey: query.TestPipeline
tags: [function private test]
```

```Go
func TestPipeline(t *testing.T)
```

### <a id="TestPipeline_equivalence" href="#TestPipeline_equivalence">func TestPipeline_equivalence(t *testing.T)</a>

```
searchKey: query.TestPipeline_equivalence
tags: [function private test]
```

```Go
func TestPipeline_equivalence(t *testing.T)
```

### <a id="TestQueryField" href="#TestQueryField">func TestQueryField(t *testing.T)</a>

```
searchKey: query.TestQueryField
tags: [function private test]
```

```Go
func TestQueryField(t *testing.T)
```

### <a id="TestRepoContainsPredicate" href="#TestRepoContainsPredicate">func TestRepoContainsPredicate(t *testing.T)</a>

```
searchKey: query.TestRepoContainsPredicate
tags: [function private test]
```

```Go
func TestRepoContainsPredicate(t *testing.T)
```

### <a id="TestReporevToRegex" href="#TestReporevToRegex">func TestReporevToRegex(t *testing.T)</a>

```
searchKey: query.TestReporevToRegex
tags: [function private test]
```

```Go
func TestReporevToRegex(t *testing.T)
```

### <a id="TestScanBalancedPattern" href="#TestScanBalancedPattern">func TestScanBalancedPattern(t *testing.T)</a>

```
searchKey: query.TestScanBalancedPattern
tags: [function private test]
```

```Go
func TestScanBalancedPattern(t *testing.T)
```

### <a id="TestScanDelimited" href="#TestScanDelimited">func TestScanDelimited(t *testing.T)</a>

```
searchKey: query.TestScanDelimited
tags: [function private test]
```

```Go
func TestScanDelimited(t *testing.T)
```

### <a id="TestScanField" href="#TestScanField">func TestScanField(t *testing.T)</a>

```
searchKey: query.TestScanField
tags: [function private test]
```

```Go
func TestScanField(t *testing.T)
```

### <a id="TestScanPredicate" href="#TestScanPredicate">func TestScanPredicate(t *testing.T)</a>

```
searchKey: query.TestScanPredicate
tags: [function private test]
```

```Go
func TestScanPredicate(t *testing.T)
```

### <a id="TestStringHuman" href="#TestStringHuman">func TestStringHuman(t *testing.T)</a>

```
searchKey: query.TestStringHuman
tags: [function private test]
```

```Go
func TestStringHuman(t *testing.T)
```

### <a id="TestSubstituteAliases" href="#TestSubstituteAliases">func TestSubstituteAliases(t *testing.T)</a>

```
searchKey: query.TestSubstituteAliases
tags: [function private test]
```

```Go
func TestSubstituteAliases(t *testing.T)
```

### <a id="TestSubstituteConcat" href="#TestSubstituteConcat">func TestSubstituteConcat(t *testing.T)</a>

```
searchKey: query.TestSubstituteConcat
tags: [function private test]
```

```Go
func TestSubstituteConcat(t *testing.T)
```

### <a id="TestSubstituteCountAll" href="#TestSubstituteCountAll">func TestSubstituteCountAll(t *testing.T)</a>

```
searchKey: query.TestSubstituteCountAll
tags: [function private test]
```

```Go
func TestSubstituteCountAll(t *testing.T)
```

### <a id="TestSubstituteOrForRegexp" href="#TestSubstituteOrForRegexp">func TestSubstituteOrForRegexp(t *testing.T)</a>

```
searchKey: query.TestSubstituteOrForRegexp
tags: [function private test]
```

```Go
func TestSubstituteOrForRegexp(t *testing.T)
```

### <a id="TestTranslateBadGlobPattern" href="#TestTranslateBadGlobPattern">func TestTranslateBadGlobPattern(t *testing.T)</a>

```
searchKey: query.TestTranslateBadGlobPattern
tags: [function private test]
```

```Go
func TestTranslateBadGlobPattern(t *testing.T)
```

### <a id="TestTranslateGlobToRegex" href="#TestTranslateGlobToRegex">func TestTranslateGlobToRegex(t *testing.T)</a>

```
searchKey: query.TestTranslateGlobToRegex
tags: [function private test]
```

```Go
func TestTranslateGlobToRegex(t *testing.T)
```

### <a id="ToNodes" href="#ToNodes">func ToNodes(parameters []Parameter) []Node</a>

```
searchKey: query.ToNodes
tags: [function]
```

```Go
func ToNodes(parameters []Parameter) []Node
```

### <a id="Validate" href="#Validate">func Validate(disjuncts [][]Node) error</a>

```
searchKey: query.Validate
tags: [function]
```

```Go
func Validate(disjuncts [][]Node) error
```

### <a id="VisitField" href="#VisitField">func VisitField(nodes []Node, field string, callback func(value string, negated bool, annotation Annotation))</a>

```
searchKey: query.VisitField
tags: [function]
```

```Go
func VisitField(nodes []Node, field string, callback func(value string, negated bool, annotation Annotation))
```

VisitField convenience function that calls callback on all parameter nodes whose field matches the field argument. callback supplies the node's value and whether the value is negated. 

### <a id="VisitOperator" href="#VisitOperator">func VisitOperator(nodes []Node, callback func(kind operatorKind, operands []Node))</a>

```
searchKey: query.VisitOperator
tags: [function]
```

```Go
func VisitOperator(nodes []Node, callback func(kind operatorKind, operands []Node))
```

VisitOperator is a convenience function that calls callback on all operator nodes. callback supplies the node's kind and operands. 

### <a id="VisitParameter" href="#VisitParameter">func VisitParameter(nodes []Node, callback func(field, value string, negated bool, annotation Annotation))</a>

```
searchKey: query.VisitParameter
tags: [function]
```

```Go
func VisitParameter(nodes []Node, callback func(field, value string, negated bool, annotation Annotation))
```

VisitParameter is a convenience function that calls callback on all parameter nodes. callback supplies the node's field, value, and whether the value is negated. 

### <a id="VisitPattern" href="#VisitPattern">func VisitPattern(nodes []Node, callback func(value string, negated bool, annotation Annotation))</a>

```
searchKey: query.VisitPattern
tags: [function]
```

```Go
func VisitPattern(nodes []Node, callback func(value string, negated bool, annotation Annotation))
```

VisitPattern is a convenience function that calls callback on all pattern nodes. callback supplies the node's value value, and whether the value is negated or quoted. 

### <a id="containsPattern" href="#containsPattern">func containsPattern(node Node) bool</a>

```
searchKey: query.containsPattern
tags: [function private]
```

```Go
func containsPattern(node Node) bool
```

containsPattern returns true if any descendent of nodes is a search pattern. 

### <a id="distribute" href="#distribute">func distribute(prefixes [][]Node, nodes []Node) [][]Node</a>

```
searchKey: query.distribute
tags: [function private]
```

```Go
func distribute(prefixes [][]Node, nodes []Node) [][]Node
```

distribute applies the distributed property to nodes. See the dnf function for context. Its first argument takes the current set of prefixes to prepend to each term in an or-expression. 

### <a id="ellipsesForHoles" href="#ellipsesForHoles">func ellipsesForHoles(nodes []Node) []Node</a>

```
searchKey: query.ellipsesForHoles
tags: [function private]
```

```Go
func ellipsesForHoles(nodes []Node) []Node
```

ellipsesForHoles substitutes ellipses ... for :[_] holes in structural search queries. 

### <a id="escapeParens" href="#escapeParens">func escapeParens(s string) string</a>

```
searchKey: query.escapeParens
tags: [function private]
```

```Go
func escapeParens(s string) string
```

escapeParens is a heuristic used in the context of regular expression search. It escapes two kinds of patterns: 

1. Any occurrence of () is converted to \(\). In regex () implies the empty string, which is meaningless as a search query and probably not what the user intended. 

2. If the pattern ends with a trailing and unescaped (, it is escaped. Normally, a pattern like foo.*bar( would be an invalid regexp, and we would show no results. But, it is a common and convenient syntax to search for, so we convert thsi pattern to interpret a trailing parenthesis literally. 

Any other forms are ignored, for example, foo.*(bar is unchanged. In the parser pipeline, such unchanged and invalid patterns are rejected by the validate function. 

### <a id="escapeParensHeuristic" href="#escapeParensHeuristic">func escapeParensHeuristic(nodes []Node) []Node</a>

```
searchKey: query.escapeParensHeuristic
tags: [function private]
```

```Go
func escapeParensHeuristic(nodes []Node) []Node
```

escapeParensHeuristic escapes certain parentheses in search patterns (see escapeParens). 

### <a id="exists" href="#exists">func exists(nodes []Node, fn func(node Node) bool) bool</a>

```
searchKey: query.exists
tags: [function private]
```

```Go
func exists(nodes []Node, fn func(node Node) bool) bool
```

exists traverses every node in nodes and returns early as soon as fn is satisfied. 

### <a id="forAll" href="#forAll">func forAll(nodes []Node, fn func(node Node) bool) bool</a>

```
searchKey: query.forAll
tags: [function private]
```

```Go
func forAll(nodes []Node, fn func(node Node) bool) bool
```

forAll traverses every node in nodes and returns whether all nodes satisfy fn. 

### <a id="fuzzifyGlobPattern" href="#fuzzifyGlobPattern">func fuzzifyGlobPattern(value string) string</a>

```
searchKey: query.fuzzifyGlobPattern
tags: [function private]
```

```Go
func fuzzifyGlobPattern(value string) string
```

### <a id="globToRegex" href="#globToRegex">func globToRegex(value string) (string, error)</a>

```
searchKey: query.globToRegex
tags: [function private]
```

```Go
func globToRegex(value string) (string, error)
```

globToRegex converts a glob string to a regular expression. We support: *, ?, and character classes [...]. 

### <a id="identity" href="#identity">func identity(nodes []Node) ([]Node, error)</a>

```
searchKey: query.identity
tags: [function private]
```

```Go
func identity(nodes []Node) ([]Node, error)
```

### <a id="isPatternExpression" href="#isPatternExpression">func isPatternExpression(nodes []Node) bool</a>

```
searchKey: query.isPatternExpression
tags: [function private]
```

```Go
func isPatternExpression(nodes []Node) bool
```

isPatternExpression returns true if every leaf node in nodes is a search pattern expression. 

### <a id="isSet" href="#isSet">func isSet(h, heuristic heuristics) bool</a>

```
searchKey: query.isSet
tags: [function private]
```

```Go
func isSet(h, heuristic heuristics) bool
```

### <a id="isSpace" href="#isSpace">func isSpace(buf []byte) bool</a>

```
searchKey: query.isSpace
tags: [function private]
```

```Go
func isSpace(buf []byte) bool
```

### <a id="labelStructural" href="#labelStructural">func labelStructural(nodes []Node) []Node</a>

```
searchKey: query.labelStructural
tags: [function private]
```

```Go
func labelStructural(nodes []Node) []Node
```

labelStructural converts Literal labels to Structural labels. Structural queries are parsed the same as literal queries, we just convert the labels as a postprocessing step to keep the parser lean. 

### <a id="labelsToString" href="#labelsToString">func labelsToString(nodes []Node) string</a>

```
searchKey: query.labelsToString
tags: [function private]
```

```Go
func labelsToString(nodes []Node) string
```

### <a id="newOperator" href="#newOperator">func newOperator(nodes []Node, kind operatorKind) []Node</a>

```
searchKey: query.newOperator
tags: [function private]
```

```Go
func newOperator(nodes []Node, kind operatorKind) []Node
```

newOperator constructs a new node of kind operatorKind with operands nodes, reducing nodes as needed. 

### <a id="nodesToJSON" href="#nodesToJSON">func nodesToJSON(nodes []Node) string</a>

```
searchKey: query.nodesToJSON
tags: [function private]
```

```Go
func nodesToJSON(nodes []Node) string
```

### <a id="nonPredicateRepos" href="#nonPredicateRepos">func nonPredicateRepos(q Basic) []Node</a>

```
searchKey: query.nonPredicateRepos
tags: [function private]
```

```Go
func nonPredicateRepos(q Basic) []Node
```

nonPredicateRepos returns the repo nodes in a query that aren't predicates, respecting parameters that determine repo results. 

### <a id="parseAndOrGrammar" href="#parseAndOrGrammar">func parseAndOrGrammar(in string) ([]Node, error)</a>

```
searchKey: query.parseAndOrGrammar
tags: [function private]
```

```Go
func parseAndOrGrammar(in string) ([]Node, error)
```

### <a id="parseBool" href="#parseBool">func parseBool(s string) (bool, error)</a>

```
searchKey: query.parseBool
tags: [function private]
```

```Go
func parseBool(s string) (bool, error)
```

parseBool is like strconv.ParseBool except that it also accepts y, Y, yes, YES, Yes, n, N, no, NO, No. 

### <a id="parseRegexpOrPanic" href="#parseRegexpOrPanic">func parseRegexpOrPanic(field, value string) *regexp.Regexp</a>

```
searchKey: query.parseRegexpOrPanic
tags: [function private]
```

```Go
func parseRegexpOrPanic(field, value string) *regexp.Regexp
```

### <a id="partition" href="#partition">func partition(nodes []Node, fn func(node Node) bool) (left, right []Node)</a>

```
searchKey: query.partition
tags: [function private]
```

```Go
func partition(nodes []Node, fn func(node Node) bool) (left, right []Node)
```

partition partitions nodes into left and right groups. A node is put in the left group if fn evaluates to true, or in the right group if fn evaluates to false. 

### <a id="partitionParameters" href="#partitionParameters">func partitionParameters(nodes []Node) []Node</a>

```
searchKey: query.partitionParameters
tags: [function private]
```

```Go
func partitionParameters(nodes []Node) []Node
```

partitionParameters constructs a parse tree to distinguish terms where ordering is insignificant (e.g., "repo:foo file:bar") versus terms where ordering may be significant (e.g., search patterns like "foo bar"). 

The resulting tree defines an ordering relation on nodes in the following cases: (1) When more than one search patterns exist at the same operator level, they are concatenated in order. (2) Any nonterminal node is concatenated (ordered in the tree) if its descendents contain one or more search patterns. 

### <a id="planToString" href="#planToString">func planToString(disjuncts [][]Node) string</a>

```
searchKey: query.planToString
tags: [function private]
```

```Go
func planToString(disjuncts [][]Node) string
```

### <a id="processTopLevel" href="#processTopLevel">func processTopLevel(nodes []Node) ([]Node, error)</a>

```
searchKey: query.processTopLevel
tags: [function private]
```

```Go
func processTopLevel(nodes []Node) ([]Node, error)
```

processTopLevel processes the top level of a query. It validates that we can process the query with respect to and/or expressions on file content, but not otherwise for nested parameters. 

### <a id="product" href="#product">func product(left [][]Node, right []Node) [][]Node</a>

```
searchKey: query.product
tags: [function private]
```

```Go
func product(left [][]Node, right []Node) [][]Node
```

product appends the list of n elements in right to each of the m rows in left. If left is empty, it is initialized with right. 

### <a id="reduce" href="#reduce">func reduce(left, right []Node, kind operatorKind) ([]Node, bool)</a>

```
searchKey: query.reduce
tags: [function private]
```

```Go
func reduce(left, right []Node, kind operatorKind) ([]Node, bool)
```

reduce takes lists of left and right nodes and reduces them if possible. For example, (and a (b and c))       => (and a b c) (((a and b) or c) or d) => (or (and a b) c d) 

### <a id="reporevToRegex" href="#reporevToRegex">func reporevToRegex(value string) (string, error)</a>

```
searchKey: query.reporevToRegex
tags: [function private]
```

```Go
func reporevToRegex(value string) (string, error)
```

reporevToRegex is a wrapper around globToRegex that takes care of treating repo and rev (as in repo@rev) separately during translation from glob to regex. 

### <a id="resolveFieldAlias" href="#resolveFieldAlias">func resolveFieldAlias(field string) string</a>

```
searchKey: query.resolveFieldAlias
tags: [function private]
```

```Go
func resolveFieldAlias(field string) string
```

resolveFieldAlias resolves an aliased field like `r:` to its canonical name like `repo:`. 

### <a id="skipSpace" href="#skipSpace">func skipSpace(buf []byte) int</a>

```
searchKey: query.skipSpace
tags: [function private]
```

```Go
func skipSpace(buf []byte) int
```

skipSpace returns the number of whitespace bytes skipped from the beginning of a buffer buf. 

### <a id="stringHumanParameters" href="#stringHumanParameters">func stringHumanParameters(parameters []Parameter) string</a>

```
searchKey: query.stringHumanParameters
tags: [function private]
```

```Go
func stringHumanParameters(parameters []Parameter) string
```

### <a id="stringHumanPattern" href="#stringHumanPattern">func stringHumanPattern(nodes []Node) string</a>

```
searchKey: query.stringHumanPattern
tags: [function private]
```

```Go
func stringHumanPattern(nodes []Node) string
```

### <a id="substituteConcat" href="#substituteConcat">func substituteConcat(callback func([]Pattern) Pattern) func(nodes []Node) []Node</a>

```
searchKey: query.substituteConcat
tags: [function private]
```

```Go
func substituteConcat(callback func([]Pattern) Pattern) func(nodes []Node) []Node
```

substituteConcat returns a function that concatenates all contiguous patterns in the tree, rooted by a concat operator. Concat operators containing negated patterns are lifted out: (concat "a" (not "b")) -> ("a" (not "b")) 

The callback parameter defines how the function concatenates patterns. The return value of callback is substituted in-place in the tree. 

### <a id="substituteOrForRegexp" href="#substituteOrForRegexp">func substituteOrForRegexp(nodes []Node) []Node</a>

```
searchKey: query.substituteOrForRegexp
tags: [function private]
```

```Go
func substituteOrForRegexp(nodes []Node) []Node
```

### <a id="toJSON" href="#toJSON">func toJSON(node Node) interface{}</a>

```
searchKey: query.toJSON
tags: [function private]
```

```Go
func toJSON(node Node) interface{}
```

### <a id="toParameters" href="#toParameters">func toParameters(nodes []Node) []Parameter</a>

```
searchKey: query.toParameters
tags: [function private]
```

```Go
func toParameters(nodes []Node) []Parameter
```

Converts a flat list of nodes to parameters. Invariant: nodes are parameters. This function is intended for internal use only, which assumes the invariant. 

### <a id="toString" href="#toString">func toString(nodes []Node) string</a>

```
searchKey: query.toString
tags: [function private]
```

```Go
func toString(nodes []Node) string
```

toString returns a string representation of a query's structure. 

### <a id="translateCharacterClass" href="#translateCharacterClass">func translateCharacterClass(r []rune, startIx int) (int, string, error)</a>

```
searchKey: query.translateCharacterClass
tags: [function private]
```

```Go
func translateCharacterClass(r []rune, startIx int) (int, string, error)
```

translateCharacterClass translates character classes like [a-zA-Z]. 

### <a id="validate" href="#validate">func validate(nodes []Node) error</a>

```
searchKey: query.validate
tags: [function private]
```

```Go
func validate(nodes []Node) error
```

### <a id="validateCommitParameters" href="#validateCommitParameters">func validateCommitParameters(nodes []Node) error</a>

```
searchKey: query.validateCommitParameters
tags: [function private]
```

```Go
func validateCommitParameters(nodes []Node) error
```

Queries containing commit parameters without type:diff or type:commit are not valid. cf. [https://docs.sourcegraph.com/code_search/reference/language#commit-parameter](https://docs.sourcegraph.com/code_search/reference/language#commit-parameter) 

### <a id="validateField" href="#validateField">func validateField(field, value string, negated bool, seen map[string]struct{}) error</a>

```
searchKey: query.validateField
tags: [function private]
```

```Go
func validateField(field, value string, negated bool, seen map[string]struct{}) error
```

### <a id="validateParameters" href="#validateParameters">func validateParameters(nodes []Node) error</a>

```
searchKey: query.validateParameters
tags: [function private]
```

```Go
func validateParameters(nodes []Node) error
```

### <a id="validatePattern" href="#validatePattern">func validatePattern(nodes []Node) error</a>

```
searchKey: query.validatePattern
tags: [function private]
```

```Go
func validatePattern(nodes []Node) error
```

### <a id="validatePredicates" href="#validatePredicates">func validatePredicates(nodes []Node) error</a>

```
searchKey: query.validatePredicates
tags: [function private]
```

```Go
func validatePredicates(nodes []Node) error
```

validatePredicates validates predicate parameters with respect to their validation logic. 

### <a id="validatePureLiteralPattern" href="#validatePureLiteralPattern">func validatePureLiteralPattern(nodes []Node, balanced bool) error</a>

```
searchKey: query.validatePureLiteralPattern
tags: [function private]
```

```Go
func validatePureLiteralPattern(nodes []Node, balanced bool) error
```

validatePureLiteralPattern checks that no pattern expression contains and/or operators nested inside concat. It may happen that we interpret a query this way due to ambiguity. If this happens, return an error message. 

### <a id="validateRepoHasFile" href="#validateRepoHasFile">func validateRepoHasFile(nodes []Node) error</a>

```
searchKey: query.validateRepoHasFile
tags: [function private]
```

```Go
func validateRepoHasFile(nodes []Node) error
```

validateRepoHasFile validates that the repohasfile parameter can be executed. A query like `repohasfile:foo type:symbol patter-to-match-symbols` is currently not supported. 

### <a id="validateRepoRevPair" href="#validateRepoRevPair">func validateRepoRevPair(nodes []Node) error</a>

```
searchKey: query.validateRepoRevPair
tags: [function private]
```

```Go
func validateRepoRevPair(nodes []Node) error
```

A query is invalid if it contains a rev: filter and a repo is specified with @. 

### <a id="validateTypeStructural" href="#validateTypeStructural">func validateTypeStructural(nodes []Node) error</a>

```
searchKey: query.validateTypeStructural
tags: [function private]
```

```Go
func validateTypeStructural(nodes []Node) error
```

