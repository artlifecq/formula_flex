package org.mokylin.skin.app.sevenday
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Day_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon:feathers.controls.UIAsset;

		public var bg1:feathers.controls.UIAsset;

		public var bg2:feathers.controls.UIAsset;

		public var dayIcon:feathers.controls.UIAsset;

		public var uiDay:feathers.controls.UIAsset;

		public var uiKeling:feathers.controls.UIAsset;

		public var uiLingqu:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Day_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 153;
			this.width = 124;
			this.elementsContent = [bg1_i(),bg2_i(),Icon_i(),dayIcon_i(),uiDay_i(),uiLingqu_i(),uiKeling_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon = temp;
			temp.name = "Icon";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/sevenday/image/tubiaokuang.png";
			temp.x = 17;
			temp.y = 36;
			return temp;
		}

		private function bg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg1 = temp;
			temp.name = "bg1";
			temp.styleName = "ui/app/sevenday/btn/xuanzhonghui.png";
			temp.x = 0;
			temp.y = 9;
			return temp;
		}

		private function bg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg2 = temp;
			temp.name = "bg2";
			temp.styleName = "ui/app/sevenday/btn/xuanzhong.png";
			temp.x = 0;
			temp.y = 9;
			return temp;
		}

		private function dayIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dayIcon = temp;
			temp.name = "dayIcon";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/sevenday/image/tubiao/zq.png";
			temp.x = 12;
			temp.y = 7;
			return temp;
		}

		private function uiDay_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiDay = temp;
			temp.name = "uiDay";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/sevenday/word/1t.png";
			temp.x = 28;
			temp.y = 0;
			return temp;
		}

		private function uiKeling_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiKeling = temp;
			temp.name = "uiKeling";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/sevenday/image/mrkl.png";
			temp.x = 13;
			temp.y = 96;
			return temp;
		}

		private function uiLingqu_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLingqu = temp;
			temp.name = "uiLingqu";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/sevenday/image/ylq.png";
			temp.x = 13;
			temp.y = 96;
			return temp;
		}

	}
}