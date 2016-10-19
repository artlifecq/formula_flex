package com.game.engine3D.utils
{
	import com.game.engine3D.vo.CallBackData;

	/**
	 *
	 * 回调工具
	 * @author L.L.M.Sunny
	 * 创建时间：2015-10-09 下午4:05:12
	 *
	 */
	public class CallBackUtil
	{
		public function CallBackUtil()
		{
		}

		public static function addCallBackData(list : Vector.<CallBackData>, value : Function, args : Array = null) : void
		{
			if (list)
			{
				var len : int = list.length;
				var cbData : CallBackData;
				while (len-- > 0)
				{
					cbData = list[len];
					if (cbData && cbData.callBackFun == value) //有了重置参数
					{
						cbData.cbFunParames = args;
						return;
					}
				}
				cbData = new CallBackData(value, args);
				list.push(cbData);
			}
		}

		public static function exceteCallBackData(thisArg : *, list : Vector.<CallBackData>, ... args) : void
		{
			if (list)
			{
				var cbList : Vector.<CallBackData> = list.concat(); //拷贝一份了执行...
				var i : uint = 0;
				for (i = 0; i < cbList.length; i++)
				{
					var cbData : CallBackData = cbList[i];
					if (cbData && cbData.callBackFun != null) //有了就不管了
					{
						var arr : Array = [];
						if (cbData.cbFunParames && cbData.cbFunParames.length)
						{
							arr = cbData.cbFunParames.concat(thisArg);
						}
						else
						{
							arr = [thisArg];
						}
						arr = args.concat(arr);
						//						try
						//						{
						//							var k:Sprite = Sprite(cbData.callBackFun);
						//						}
						//						catch(err:Error)
						//						{
						//							var fn:String = err.message.replace(/.+::(\w+\/\w+)\(\)\}\@.+/,"$1");
						//							fn = err.message?(err.message.replace(/.+ (function\-\d+) .+/i,"$1")):fn;
						//							trace(fn,arr); 
						//						}
						cbData.callBackFun.apply(null, arr);
					}
				}
			}
		}

		public static function removeCallBackData(list : Vector.<CallBackData>, value : Function) : void
		{
			if (list)
			{
				var len : int = list.length;
				var cbData : CallBackData;
				while (len-- > 0)
				{
					cbData = list[len];
					if (cbData && cbData.callBackFun == value) //有了就不管了
					{
						list.splice(len, 1);
					}
				}
			}
		}
	}
}
