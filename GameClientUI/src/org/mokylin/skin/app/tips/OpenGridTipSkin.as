package org.mokylin.skin.app.tips
{
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.layout.VerticalLayout;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class OpenGridTipSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grp:feathers.controls.Group;

		public var imgBG:feathers.controls.UIAsset;

		public var labDesc:feathers.controls.Label;

		public var labProp:feathers.controls.Label;

		public var labTime:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function OpenGridTipSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 83;
			this.width = 200;
			this.elementsContent = [imgBG_i(),grp_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __OpenGridTipSkin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = 6;
			temp.padding = 10;
			return temp;
		}

		private function grp_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp = temp;
			temp.name = "grp";
			temp.height = 82;
			temp.width = 200;
			temp.x = 0;
			temp.y = 1;
			temp.layout = __OpenGridTipSkin_VerticalLayout1_i();
			temp.elementsContent = [labProp_i(),labTime_i(),labDesc_i()];
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 83;
			temp.styleName = "ui/common/tip/tips_di.png";
			temp.width = 200;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc = temp;
			temp.name = "labDesc";
			temp.text = "点击立即开启格子";
			temp.color = 0xD3B108;
			temp.width = 180;
			temp.x = 1;
			return temp;
		}

		private function labProp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labProp = temp;
			temp.name = "labProp";
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "+1";
			temp.color = 0x02FB07;
			temp.width = 182;
			return temp;
		}

		private function labTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTime = temp;
			temp.name = "labTime";
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "+1";
			temp.color = 0x02FB07;
			temp.width = 182;
			return temp;
		}

	}
}