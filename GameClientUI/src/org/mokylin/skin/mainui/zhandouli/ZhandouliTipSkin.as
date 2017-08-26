package org.mokylin.skin.mainui.zhandouli
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ZhandouliTipSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var num_lv:feathers.controls.UINumber;

		public var num_yellow1:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ZhandouliTipSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 57;
			this.width = 326;
			this.elementsContent = [__ZhandouliTipSkin_UIAsset1_i(),num_yellow1_i(),num_lv_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ZhandouliTipSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/zdl.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function num_lv_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_lv = temp;
			temp.name = "num_lv";
			temp.gap = -5;
			temp.height = 38;
			temp.label = "x364";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow;
			temp.width = 97;
			temp.x = 219;
			temp.y = 10;
			return temp;
		}

		private function num_yellow1_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_yellow1 = temp;
			temp.name = "num_yellow1";
			temp.gap = -6;
			temp.height = 38;
			temp.label = "5364";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow;
			temp.width = 97;
			temp.x = 118;
			temp.y = 10;
			return temp;
		}

	}
}