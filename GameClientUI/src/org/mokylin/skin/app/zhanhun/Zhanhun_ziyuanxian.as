package org.mokylin.skin.app.zhanhun
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Zhanhun_ziyuanxian extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var icon:feathers.controls.UIAsset;

		public var lb_cishu:feathers.controls.Label;

		public var lb_jinyan:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zhanhun_ziyuanxian()
		{
			super();
			
			this.currentState = "normal";
			this.height = 34;
			this.width = 257;
			this.elementsContent = [__Zhanhun_ziyuanxian_UIAsset1_i(),lb_name_i(),lb_cishu_i(),lb_jinyan_i(),icon_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Zhanhun_ziyuanxian_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/kongzhitiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/app/zhanhun/feizou.png";
			temp.x = 235;
			temp.y = 3;
			return temp;
		}

		private function lb_cishu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_cishu = temp;
			temp.name = "lb_cishu";
			temp.text = "0/9";
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 54;
			temp.x = 116;
			temp.y = 7;
			return temp;
		}

		private function lb_jinyan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_jinyan = temp;
			temp.name = "lb_jinyan";
			temp.text = "5点";
			temp.textAlign = "left";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 40;
			temp.x = 202;
			temp.y = 7;
			return temp;
		}

		private function lb_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name = temp;
			temp.name = "lb_name";
			temp.text = "跨服皇城争霸战";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 3;
			temp.y = 7;
			return temp;
		}

	}
}