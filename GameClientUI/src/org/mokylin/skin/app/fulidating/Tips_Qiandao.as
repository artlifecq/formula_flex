package org.mokylin.skin.app.fulidating
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
	public class Tips_Qiandao extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgBG:feathers.controls.UIAsset;

		public var imgLine1:feathers.controls.UIAsset;

		public var lbl_miaoshu:feathers.controls.Label;

		public var lbl_name:feathers.controls.Label;

		public var lbl_name0:feathers.controls.Label;

		public var lbl_vip1:feathers.controls.Label;

		public var lbl_vip2:feathers.controls.Label;

		public var lbl_vip3:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_Qiandao()
		{
			super();
			
			this.currentState = "normal";
			this.height = 153;
			this.width = 280;
			this.elementsContent = [imgBG_i(),lbl_name_i(),lbl_vip1_i(),lbl_vip2_i(),lbl_vip3_i(),lbl_name0_i(),lbl_miaoshu_i(),imgLine1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.top = 0;
			return temp;
		}

		private function imgLine1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine1 = temp;
			temp.name = "imgLine1";
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 8;
			temp.y = 74;
			return temp;
		}

		private function lbl_miaoshu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_miaoshu = temp;
			temp.name = "lbl_miaoshu";
			temp.height = 18;
			temp.htmlText = "本月剩余签到天数：</font><font color='#00ff33'>0</font>";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 229;
			temp.x = 10;
			temp.y = 50;
			return temp;
		}

		private function lbl_name0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name0 = temp;
			temp.name = "lbl_name0";
			temp.bold = false;
			temp.height = 19;
			temp.htmlText = "我的VIP等级：</font><font color='#00ff33'>白金</font>";
			temp.fontSize = 14;
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 247;
			temp.x = 10;
			temp.y = 30;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.bold = true;
			temp.height = 19;
			temp.fontSize = 14;
			temp.text = "签到";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 247;
			temp.x = 10;
			temp.y = 10;
			return temp;
		}

		private function lbl_vip1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_vip1 = temp;
			temp.name = "lbl_vip1";
			temp.bold = false;
			temp.height = 19;
			temp.htmlText = "<font color='#ffea00'>白银VIP</font> 可补签 </font><font color='#00ff33'>3天</font>";
			temp.fontSize = 14;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 247;
			temp.x = 10;
			temp.y = 84;
			return temp;
		}

		private function lbl_vip2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_vip2 = temp;
			temp.name = "lbl_vip2";
			temp.bold = false;
			temp.height = 19;
			temp.htmlText = "<font color='#ffea00'>钻石VIP</font> 可补签 </font><font color='#00ff33'>3天</font>";
			temp.fontSize = 14;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 247;
			temp.x = 10;
			temp.y = 104;
			return temp;
		}

		private function lbl_vip3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_vip3 = temp;
			temp.name = "lbl_vip3";
			temp.bold = false;
			temp.height = 19;
			temp.htmlText = "<font color='#ffea00'>至尊VIP</font> 可补签 </font><font color='#00ff33'>3天</font>";
			temp.fontSize = 14;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 247;
			temp.x = 10;
			temp.y = 124;
			return temp;
		}

	}
}