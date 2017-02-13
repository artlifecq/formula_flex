package org.mokylin.skin.common
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.erjiItem_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class erjiItem_wuping_Skin extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function erjiItem_wuping_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 84;
			this.width = 88;
			this.elementsContent = [__erjiItem_wuping_Skin_UIAsset1_i(),__erjiItem_wuping_Skin_Button1_i(),__erjiItem_wuping_Skin_Button2_i(),__erjiItem_wuping_Skin_Button3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __erjiItem_wuping_Skin_Button1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			temp.label = "使用";
			temp.styleClass = org.mokylin.skin.common.erjiItem_Skin;
			temp.width = 70;
			temp.x = 9;
			temp.y = 7;
			return temp;
		}

		private function __erjiItem_wuping_Skin_Button2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			temp.label = "展示";
			temp.styleClass = org.mokylin.skin.common.erjiItem_Skin;
			temp.width = 70;
			temp.x = 9;
			temp.y = 32;
			return temp;
		}

		private function __erjiItem_wuping_Skin_Button3_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			temp.label = "丢弃";
			temp.styleClass = org.mokylin.skin.common.erjiItem_Skin;
			temp.width = 70;
			temp.x = 9;
			temp.y = 56;
			return temp;
		}

		private function __erjiItem_wuping_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.top = 0;
			return temp;
		}

	}
}