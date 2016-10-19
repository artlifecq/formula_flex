package org.mokylin.skin.loginui
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HeroStepTitleSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var step1Title:feathers.controls.UIAsset;

		public var step2Title:feathers.controls.UIAsset;

		public var step3Title:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HeroStepTitleSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 924;
			this.width = 1643;
			this.elementsContent = [step1Title_i(),step2Title_i(),step3Title_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function step1Title_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			step1Title = temp;
			temp.name = "step1Title";
			temp.height = 32;
			temp.styleName = "ui/loginui/loginuiOther/qing_xuanze_chushixingxiang.png";
			temp.width = 168;
			temp.x = 745;
			temp.y = 60;
			return temp;
		}

		private function step2Title_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			step2Title = temp;
			temp.name = "step2Title";
			temp.height = 32;
			temp.styleName = "ui/loginui/loginuiOther/qing_xuanze_touxiang.png";
			temp.width = 140;
			temp.x = 759;
			temp.y = 60;
			return temp;
		}

		private function step3Title_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			step3Title = temp;
			temp.name = "step3Title";
			temp.height = 32;
			temp.styleName = "ui/loginui/loginuiOther/qing_xuanze_chushengdi.png";
			temp.width = 168;
			temp.x = 745;
			temp.y = 60;
			return temp;
		}

	}
}