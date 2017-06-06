package org.mokylin.skin.app.zhanchang
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
	public class ZhanDouKaiQi_Skin extends feathers.controls.StateSkin
	{
		public var numLevel:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ZhanDouKaiQi_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 69;
			this.width = 236;
			this.elementsContent = [numLevel_i(),__ZhanDouKaiQi_Skin_UIAsset1_i(),__ZhanDouKaiQi_Skin_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ZhanDouKaiQi_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 25;
			temp.styleName = "ui/app/zhanchang/jiucengyaota/paihangdi.png";
			temp.width = 236;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ZhanDouKaiQi_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/zhandoukaiqi.png";
			temp.x = 7;
			temp.y = 2;
			return temp;
		}

		private function numLevel_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numLevel = temp;
			temp.name = "numLevel";
			temp.height = 37;
			temp.label = "5";
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberDaojishi;
			temp.width = 34;
			temp.x = 109;
			temp.y = 32;
			return temp;
		}

	}
}