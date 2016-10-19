package org.mokylin.skin.app.relive
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_green2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ReliveTypeListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnRelive:feathers.controls.Button;

		public var labInfo:feathers.controls.Label;

		public var labReliveType:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ReliveTypeListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 69;
			this.width = 126;
			this.elementsContent = [btnRelive_i(),labReliveType_i(),labInfo_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnRelive_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRelive = temp;
			temp.name = "btnRelive";
			temp.height = 29;
			temp.label = "安全复活";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 100;
			temp.x = 13;
			temp.y = 0;
			return temp;
		}

		private function labInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labInfo = temp;
			temp.name = "labInfo";
			temp.height = 17;
			temp.text = "6两";
			temp.textAlign = "center";
			temp.width = 126;
			temp.x = 0;
			temp.y = 52;
			return temp;
		}

		private function labReliveType_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labReliveType = temp;
			temp.name = "labReliveType";
			temp.text = "免费";
			temp.textAlign = "center";
			temp.width = 126;
			temp.x = 0;
			temp.y = 32;
			return temp;
		}

	}
}