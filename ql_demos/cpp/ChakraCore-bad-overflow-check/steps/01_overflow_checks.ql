import cpp

/** Matches `var < var + ???`. */
predicate overflowCheck(LocalScopeVariable var, AddExpr add) {
  exists(RelationalOperation compare |
    compare.getAnOperand() = var.getAnAccess() and
    compare.getAnOperand() = add and
    add.getAnOperand() = var.getAnAccess()
  )
}

from LocalScopeVariable var, AddExpr add
where overflowCheck(var, add)
select add, "Overflow check on variable of type " + var.getUnderlyingType()
