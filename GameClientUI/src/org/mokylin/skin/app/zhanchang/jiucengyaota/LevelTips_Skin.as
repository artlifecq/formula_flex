package org.mokylin.skin.app.zhanchang.jiucengyaota
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zhanchang.uinumber.UINumberDaojishi;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class LevelTips_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var numLevel:feathers.controls.UINumber;

		public var uiLeft:feathers.controls.UIAsset;

		public var uiRight:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function LevelTips_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 44;
			this.width = 301;
			this.elementsContent = [__LevelTips_Skin_UIAsset1_i(),uiLeft_i(),uiRight_i(),numLevel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __LevelTips_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/gongwu_bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function numLevel_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numLevel = temp;
			temp.name = "numLevel";
			temp.height = 37;
			temp.label = "2";
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberDaojishi;
			temp.width = 34;
			temp.x = 156;
			temp.y = 1;
			return temp;
		}

		private function uiLeft_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLeft = temp;
			temp.name = "uiLeft";
			temp.styleName = "ui/app/zhanchang/gongrudi.png";
			temp.x = 62;
			temp.y = 6;
			return temp;
		}

		private function uiRight_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiRight = temp;
			temp.name = "uiRight";
			temp.styleName = "ui/app/zhanchang/cen.png";
			temp.x = 198;
			temp.y = 6;
			return temp;
		}

	}
}