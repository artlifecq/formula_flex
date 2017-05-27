package org.mokylin.skin.app.xingongneng
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class KaiQi_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icons:feathers.controls.UIAsset;

		public var uiEffect:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function KaiQi_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 262;
			this.width = 243;
			this.elementsContent = [uiEffect_i(),__KaiQi_Skin_UIAsset1_i(),uiName_i(),Icons_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icons_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icons = temp;
			temp.name = "Icons";
			temp.styleName = "ui/app/xingongneng/icon/jingyanfuben/145.png";
			temp.x = 49;
			temp.y = 22;
			return temp;
		}

		private function __KaiQi_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/xingongneng/bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiEffect_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiEffect = temp;
			temp.name = "uiEffect";
			temp.height = 10;
			temp.width = 10;
			temp.x = 116;
			temp.y = 81;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/xingongneng/junjie.png";
			temp.x = 89;
			temp.y = 151;
			return temp;
		}

	}
}