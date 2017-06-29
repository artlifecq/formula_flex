package org.mokylin.skin.app.wuxue
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
	public class Tips_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var icon:feathers.controls.UIAsset;

		public var imgBg:feathers.controls.UIAsset;

		public var imgLine1:feathers.controls.UIAsset;

		public var imgLine2:feathers.controls.UIAsset;

		public var lb_dengji:feathers.controls.Label;

		public var lb_jihuo:feathers.controls.Label;

		public var lb_shengming:feathers.controls.Label;

		public var skillName:feathers.controls.UIAsset;

		public var uiName1:feathers.controls.UIAsset;

		public var uiName2:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 193;
			this.width = 280;
			this.elementsContent = [imgBg_i(),imgLine2_i(),imgLine1_i(),icon_i(),skillName_i(),lb_jihuo_i(),uiName1_i(),uiName2_i(),lb_dengji_i(),lb_shengming_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/common/tips/icon/shengshengbuxi.png";
			temp.x = 12;
			temp.y = 12;
			return temp;
		}

		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.height = 193;
			temp.styleName = "ui/common/tips/jinengdi.png";
			temp.top = 0;
			temp.width = 281;
			temp.x = 0;
			return temp;
		}

		private function imgLine1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine1 = temp;
			temp.name = "imgLine1";
			temp.styleName = "ui/common/tips/xian.png";
			temp.width = 264;
			temp.x = 7;
			temp.y = 74;
			return temp;
		}

		private function imgLine2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine2 = temp;
			temp.name = "imgLine2";
			temp.styleName = "ui/common/tips/xian.png";
			temp.width = 264;
			temp.x = 7;
			temp.y = 133;
			return temp;
		}

		private function lb_dengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_dengji = temp;
			temp.name = "lb_dengji";
			temp.leading = 0;
			temp.letterSpacing = -1;
			temp.text = "60级开启";
			temp.color = 0x00FF0C;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 214;
			temp.x = 11;
			temp.y = 106;
			return temp;
		}

		private function lb_jihuo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_jihuo = temp;
			temp.name = "lb_jihuo";
			temp.leading = 0;
			temp.letterSpacing = -1;
			temp.text = "未激活";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 50;
			temp.x = 75;
			temp.y = 39;
			return temp;
		}

		private function lb_shengming_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_shengming = temp;
			temp.name = "lb_shengming";
			temp.htmlText = "打怪经验获得提高<font color='#00ff33'>50%</font>";
			temp.letterSpacing = 0;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 213;
			temp.x = 11;
			temp.y = 163;
			return temp;
		}

		private function skillName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillName = temp;
			temp.name = "skillName";
			temp.styleName = "ui/common/tips/name/shengshengbuxi.png";
			temp.x = 72;
			temp.y = 15;
			return temp;
		}

		private function uiName1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName1 = temp;
			temp.name = "uiName1";
			temp.styleName = "ui/common/tips/tipswenzi/jineng/jihuotiaojian.png";
			temp.x = 13;
			temp.y = 87;
			return temp;
		}

		private function uiName2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName2 = temp;
			temp.name = "uiName2";
			temp.styleName = "ui/common/tips/tipswenzi/jineng/xiaoguo.png";
			temp.x = 13;
			temp.y = 145;
			return temp;
		}

	}
}