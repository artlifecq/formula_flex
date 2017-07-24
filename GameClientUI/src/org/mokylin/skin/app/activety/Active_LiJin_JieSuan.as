package org.mokylin.skin.app.activety
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Active_LiJin_JieSuan extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var icon0:feathers.controls.UIAsset;

		public var subbut:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Active_LiJin_JieSuan()
		{
			super();
			
			this.currentState = "normal";
			this.height = 349;
			this.width = 490;
			this.elementsContent = [__Active_LiJin_JieSuan_UIAsset1_i(),__Active_LiJin_JieSuan_UIAsset2_i(),__Active_LiJin_JieSuan_UIAsset3_i(),__Active_LiJin_JieSuan_UIAsset4_i(),subbut_i(),icon0_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Active_LiJin_JieSuan_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 238;
			temp.styleName = "ui/app/activety/zonghe/ban1.png";
			temp.x = 13;
			temp.y = 111;
			return temp;
		}

		private function __Active_LiJin_JieSuan_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/tianjianglijin.png";
			temp.x = 27;
			temp.y = 0;
			return temp;
		}

		private function __Active_LiJin_JieSuan_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tiao.png";
			temp.x = 53.5;
			temp.y = 159;
			return temp;
		}

		private function __Active_LiJin_JieSuan_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tiaozhan.png";
			temp.x = 153;
			temp.y = 164;
			return temp;
		}

		private function icon0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon0 = temp;
			temp.name = "icon0";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 211.5;
			temp.y = 207;
			return temp;
		}

		private function subbut_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			subbut = temp;
			temp.name = "subbut";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "确  认";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xFFFFFF;
			temp.width = 110;
			temp.x = 192.5;
			temp.y = 297;
			return temp;
		}

	}
}