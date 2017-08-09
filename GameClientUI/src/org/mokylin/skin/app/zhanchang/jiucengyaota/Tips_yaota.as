package org.mokylin.skin.app.zhanchang.jiucengyaota
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Tips_yaota extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbGuize:feathers.controls.Label;

		public var lbLevel:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_yaota()
		{
			super();
			
			this.currentState = "normal";
			this.height = 131;
			this.width = 364;
			this.elementsContent = [lbGuize_i(),lbLevel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function lbGuize_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbGuize = temp;
			temp.name = "lbGuize";
			temp.height = 111;
			temp.htmlText = "战场规则：<br>  1.每层击杀相应的人数可进入下一层，共<font color='#00ff33'>9</font>层。<br>  2.高层复活点复活有几率降回前一层，原地复活不降层。<br>  3.<font color='#00ff33'>1-5</font>层死亡复活点不会降层。<br>  4.战场内可获得积分奖励和层数奖励。<br>  5.<font color='#00ff33'>9</font>层玩家可争夺镇妖塔宝箱。";
			temp.leading = 4;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 401;
			temp.x = 0;
			temp.y = 20;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.htmlText = "等级需求：<font color='#00ff33'>50级</font>";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}