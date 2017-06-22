package org.mokylin.skin.app.hubao
{
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HuBaoItem2_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grpSelect:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var lb1:feathers.controls.Label;

		public var lb2:feathers.controls.Label;

		public var lb3:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HuBaoItem2_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 72;
			this.width = 139;
			this.elementsContent = [__HuBaoItem2_Skin_UIAsset1_i(),__HuBaoItem2_Skin_UIAsset2_i(),grpSelect_i(),icon1_i(),icon2_i(),icon3_i(),lb1_i(),lb2_i(),lb3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __HuBaoItem2_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hubao/jianglibg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __HuBaoItem2_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hubao/husongjiangli.png";
			temp.x = 31;
			temp.y = 0;
			return temp;
		}

		private function __HuBaoItem2_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hubao/xuanzhongguangxiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __HuBaoItem2_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/app/hubao/xuanzhongguangxiao.png";
			temp.x = 133;
			temp.y = 0;
			return temp;
		}

		private function grpSelect_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpSelect = temp;
			temp.name = "grpSelect";
			temp.x = 3;
			temp.y = 10;
			temp.elementsContent = [__HuBaoItem2_Skin_UIAsset3_i(),__HuBaoItem2_Skin_UIAsset4_i()];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 3;
			temp.y = 22;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 46;
			temp.y = 22;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 88;
			temp.y = 22;
			return temp;
		}

		private function lb1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb1 = temp;
			temp.name = "lb1";
			temp.fontSize = 12;
			temp.text = "12";
			temp.textAlign = "right";
			temp.width = 40;
			temp.x = 6;
			temp.y = 49;
			return temp;
		}

		private function lb2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb2 = temp;
			temp.name = "lb2";
			temp.fontSize = 12;
			temp.text = "12";
			temp.textAlign = "right";
			temp.width = 40;
			temp.x = 49;
			temp.y = 49;
			return temp;
		}

		private function lb3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb3 = temp;
			temp.name = "lb3";
			temp.fontSize = 12;
			temp.text = "12";
			temp.textAlign = "right";
			temp.width = 40;
			temp.x = 91;
			temp.y = 49;
			return temp;
		}

	}
}