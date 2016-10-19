package org.mokylin.skin.app.family
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import org.mokylin.skin.component.button.ButtonSkin_green2;
	import org.mokylin.skin.component.text.TextInputSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FamilyJoinSkin extends feathers.controls.StateSkin
	{
		public var btnJoinFamily:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FamilyJoinSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 352;
			this.width = 499;
			this.elementsContent = [__FamilyJoinSkin_TextArea1_i(),btnJoinFamily_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FamilyJoinSkin_TextArea1_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			temp.height = 203;
			temp.touchable = false;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInputSkin);
			temp.text = "家族加入流程略一万字...";
			temp.width = 418;
			temp.x = 33;
			temp.y = 19;
			return temp;
		}

		private function btnJoinFamily_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJoinFamily = temp;
			temp.name = "btnJoinFamily";
			temp.label = "申请加入家族";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 135;
			temp.x = 180;
			temp.y = 283;
			return temp;
		}

	}
}