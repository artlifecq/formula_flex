package org.mokylin.skin.mainui.head
{
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class guai_head_mini extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var barBlue:feathers.controls.UIAsset;

		public var barRed:feathers.controls.UIAsset;

		public var bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function guai_head_mini()
		{
			super();
			
			this.currentState = "normal";
			this.height = 21;
			this.width = 109;
			this.elementsContent = [bg_i(),barRed_i(),barBlue_i(),__guai_head_mini_Group1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __guai_head_mini_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.height = 10;
			temp.width = 49;
			temp.x = 30;
			temp.y = 3;
			temp.elementsContent = [__guai_head_mini_UIAsset1_i(),__guai_head_mini_UIAsset2_i(),__guai_head_mini_UIAsset3_i(),__guai_head_mini_UIAsset4_i()];
			return temp;
		}

		private function __guai_head_mini_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/juese/xuetiaofenge.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __guai_head_mini_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/juese/xuetiaofenge.png";
			temp.x = 16;
			temp.y = 0;
			return temp;
		}

		private function __guai_head_mini_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/juese/xuetiaofenge.png";
			temp.x = 32;
			temp.y = 0;
			return temp;
		}

		private function __guai_head_mini_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/juese/xuetiaofenge.png";
			temp.x = 48;
			temp.y = 0;
			return temp;
		}

		private function barBlue_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			barBlue = temp;
			temp.name = "barBlue";
			temp.height = 9;
			temp.styleName = "ui/mainui/head/juese/juesexuetiao2.png";
			temp.width = 79;
			temp.x = 15;
			temp.y = 4;
			return temp;
		}

		private function barRed_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			barRed = temp;
			temp.name = "barRed";
			temp.height = 9;
			temp.styleName = "ui/mainui/head/juese/juesexuetiao3.png";
			temp.width = 79;
			temp.x = 15;
			temp.y = 4;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 21;
			temp.styleName = "ui/mainui/head/mini/xuetiao_bg2.png";
			temp.width = 109;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}