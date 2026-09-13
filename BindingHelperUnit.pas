unit BindingHelperUnit;

interface

uses
  Classes, Data.Bind.Components;

type
  BindingHelper = class(TObject)
  public
    class procedure setMessageKey(var component : TComponent; const controlExpression : String;
      var source : TComponent; const sourceExpression: String; var bindingList : TBindingsList);
  end;


implementation

  class procedure BindingHelper.setMessageKey(var component : TComponent; const controlExpression : String;
    var source : TComponent; const sourceExpression: String; var bindingList : TBindingsList);
  var
    expression: TBindExpression;
    begin
      // Create a binding expression -> Descripcion.
      expression := TBindExpression.Create(nil);
      expression.ControlComponent := component;
      expression.ControlExpression := controlExpression;
      expression.SourceComponent := source;
      expression.SourceExpression := sourceExpression;
      expression.Direction := TExpressionDirection.dirBidirectional;
      // Add the expression to the bindings list.
      expression.BindingsList := bindingList;
    end;

end.
