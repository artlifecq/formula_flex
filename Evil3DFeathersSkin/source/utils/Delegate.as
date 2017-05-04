package utils{
	import flash.utils.Dictionary;

	public class Delegate {
		private static var funDictionary:Dictionary = new Dictionary;

		/**
		 * 给方法增加参数
		 */
		public static function create(method:Function, ... additionalArgs):Function {
			return createWithArgs(method, additionalArgs);
		}

		public static function createListener(method:Function, ... additionalArgs):Function {
			return createWithArgs(method, additionalArgs, true);
		}

		private static function createWithArgs(func:Function, args:*, needRemove:Boolean = false):Function {
			var f:Function = function():* {
				var func0:Function = arguments.callee.func;
				var parameters:Array = arguments.concat(args);
				return func0.apply(null, parameters);
			};

			f["func"] = func;

			if (needRemove) {
				funDictionary[func] = f;
			}
			return f;
		}

		public static function getFunction(fun:Function, autoDelete:Boolean=true):Function {
			if (funDictionary[fun] != null) {
				var f:Function = funDictionary[fun] as Function;
				if(autoDelete){
					delFunction(fun);
				}
				return f;
			} else {
				return fun;
			}
		}

		public static function delFunction(fun:Function):void {
			funDictionary[fun] = null;
			delete funDictionary[fun];
		}
	}
}