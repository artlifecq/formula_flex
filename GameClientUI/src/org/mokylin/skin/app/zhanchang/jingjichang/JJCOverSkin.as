package org.mokylin.skin.app.zhanchang.jingjichang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JJCOverSkin extends feathers.controls.StateSkin
	{
		public var btnOk:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JJCOverSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 36;
			this.width = 110;
			this.elementsContent = [btnOk_i()];
			
			states = {
			};
			skinNames={};
		}


		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "跳过战斗";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 110;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}