package org.mokylin.skin.app.maps
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jian;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class mapItems extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_jia:feathers.controls.Button;

		public var btn_jian:feathers.controls.Button;

		public var lbl_name:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function mapItems()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__mapItems_UIAsset1_i(),btn_jian_i(),btn_jia_i(),lbl_name_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __mapItems_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/titilebg/headbg1.png";
			temp.top = 0;
			return temp;
		}

		private function btn_jia_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jia = temp;
			temp.name = "btn_jia";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.visible = false;
			temp.x = 4;
			temp.y = 3;
			return temp;
		}

		private function btn_jian_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jian = temp;
			temp.name = "btn_jian";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian;
			temp.x = 4;
			temp.y = 3;
			return temp;
		}

		private function lbl_name_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.styleName = "ui/app/maps/npc.png";
			temp.x = 32;
			temp.y = 6;
			return temp;
		}

	}
}