package org.mokylin.skin.mainui.activityBar.button
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonFangChenMiSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __ButtonFangChenMiSkin_UIAsset1:feathers.controls.UIAsset;

		public var __ButtonFangChenMiSkin_UIAsset2:feathers.controls.UIAsset;

		public var __ButtonFangChenMiSkin_UIAsset3:feathers.controls.UIAsset;

		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonFangChenMiSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [labelDisplay_i(),iconDisplay_i()];
			__ButtonFangChenMiSkin_UIAsset1_i();
			__ButtonFangChenMiSkin_UIAsset2_i();
			__ButtonFangChenMiSkin_UIAsset3_i();
			
			
			states = {
			};
			skinNames={"down":"ui/mainui/activityBar/button/fangchengmi/down.png", "hover":"ui/mainui/activityBar/button/fangchengmi/over.png", "up":"ui/mainui/activityBar/button/fangchengmi/up.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ButtonFangChenMiSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonFangChenMiSkin_UIAsset1 = temp;
			temp.styleName = "ui/mainui/activityBar/button/fangchengmi/down.png";
			return temp;
		}

		private function __ButtonFangChenMiSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonFangChenMiSkin_UIAsset2 = temp;
			temp.styleName = "ui/mainui/activityBar/button/fangchengmi/over.png";
			return temp;
		}

		private function __ButtonFangChenMiSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonFangChenMiSkin_UIAsset3 = temp;
			temp.styleName = "ui/mainui/activityBar/button/fangchengmi/up.png";
			return temp;
		}

		private function iconDisplay_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconDisplay = temp;
			temp.name = "iconDisplay";
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.text = "";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.top = 0;
			temp.verticalAlign = "middle";
			return temp;
		}

	}
}