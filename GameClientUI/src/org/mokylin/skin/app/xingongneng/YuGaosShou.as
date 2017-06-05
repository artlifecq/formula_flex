package org.mokylin.skin.app.xingongneng
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class YuGaosShou extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var NumZhanli:feathers.controls.UINumber;

		public var uiChenghao:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function YuGaosShou()
		{
			super();
			
			this.currentState = "normal";
			this.height = 321;
			this.width = 266;
			this.elementsContent = [__YuGaosShou_UIAsset1_i(),uiChenghao_i(),__YuGaosShou_UIAsset2_i(),NumZhanli_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function NumZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			NumZhanli = temp;
			temp.name = "NumZhanli";
			temp.gap = -13;
			temp.height = 33;
			temp.label = "x1364";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;
			temp.width = 124;
			temp.x = 133;
			temp.y = 257;
			return temp;
		}

		private function __YuGaosShou_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/xingongneng/bg2.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __YuGaosShou_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/zdl2.png";
			temp.x = 53;
			temp.y = 249;
			return temp;
		}

		private function uiChenghao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiChenghao = temp;
			temp.name = "uiChenghao";
			temp.styleName = "ui/app/xingongneng/chenhao.png";
			temp.x = 81;
			temp.y = 20;
			return temp;
		}

	}
}