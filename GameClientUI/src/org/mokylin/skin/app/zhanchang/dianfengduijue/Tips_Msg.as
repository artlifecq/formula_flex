package org.mokylin.skin.app.zhanchang.dianfengduijue
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Tips_Msg extends feathers.controls.StateSkin
	{
		public var bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_Msg()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),__Tips_Msg_Label1_i(),__Tips_Msg_Label2_i(),__Tips_Msg_Label3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tips_Msg_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.htmlText = "等级需求：<font color='#00ff33'>50级</font>";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 11;
			temp.y = 11;
			return temp;
		}

		private function __Tips_Msg_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.htmlText = "开启时间：周一、三、四、六、日<font color='#00ff33'>21:00-21:30</font>";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 321;
			temp.x = 11;
			temp.y = 30;
			return temp;
		}

		private function __Tips_Msg_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 43;
			temp.htmlText = "战场规则：1.每日前十场可获得<font color='#00ff33'>声望奖励</font><br>          2.每日获取积分决定段位，每日24点刷新段位奖励";
			temp.leading = 7;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 384;
			temp.x = 11;
			temp.y = 49;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 99;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 404;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}