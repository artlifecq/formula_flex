package starling.rendering.deferred
{
	import starling.core.starling_internal;

	use namespace starling_internal;
	public class OperatorPool
	{
		private var _operatorLists:Vector.<Vector.<Context3DOperator>>;
		
		public function OperatorPool()
		{
			_operatorLists = new Vector.<Vector.<Context3DOperator>>(16, true);//先假定不同的种类为16
		}
		
		public function get(type:int):Context3DOperator
		{
			var operators:Vector.<Context3DOperator> = _operatorLists[type];
			if (operators == null)
			{
				operators = new Vector.<Context3DOperator>;
				_operatorLists[type] = operators;
			}
			
			if (operators.length > 0) 
				return operators.pop();
			else 
				return Context3DOperator.createOperator(type);
		}
		
		public function put(operator:Context3DOperator):void
		{
			operator.clear();
			var operators:Vector.<Context3DOperator> = _operatorLists[operator._type];
			operators[operators.length] = operator;
		}
	}
}