package org.mokylin.skin.mainui.juqing
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.mainui.juqing.button.ButtonSkin_ju1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class task_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_n1:feathers.controls.Button;

		public var btn_n2:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function task_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 228;
			this.width = 224;
			this.elementsContent = [__task_Skin_UIAsset1_i(),btn_n1_i(),btn_n2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __task_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 228;
			temp.styleName = "ui/mainui/juqing/di.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_n1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_n1 = temp;
			temp.name = "btn_n1";
			temp.label = "剧\n情";
			temp.styleClass = org.mokylin.skin.mainui.juqing.button.ButtonSkin_ju1;
			temp.x = 196;
			temp.y = 9;
			return temp;
		}

		private function btn_n2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_n2 = temp;
			temp.name = "btn_n2";
			temp.label = "玩\n法";
			temp.styleClass = org.mokylin.skin.mainui.juqing.button.ButtonSkin_ju1;
			temp.x = 196;
			temp.y = 78;
			return temp;
		}

	}
}