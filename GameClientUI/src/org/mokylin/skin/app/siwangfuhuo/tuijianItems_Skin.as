package org.mokylin.skin.app.siwangfuhuo
{
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.siwangfuhuo.Itemkuang_Skin;
	import org.mokylin.skin.app.siwangfuhuo.mc.xingxing_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class tuijianItems_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn:feathers.controls.Button;

		public var lbl_name:feathers.controls.Label;

		public var mc_star1:feathers.controls.UIMovieClip;

		public var mc_star2:feathers.controls.UIMovieClip;

		public var mc_star3:feathers.controls.UIMovieClip;

		public var mc_star4:feathers.controls.UIMovieClip;

		public var mc_star5:feathers.controls.UIMovieClip;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function tuijianItems_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [btn_i(),lbl_name_i(),mc_star1_i(),mc_star2_i(),mc_star3_i(),mc_star4_i(),mc_star5_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn = temp;
			temp.name = "btn";
			temp.styleClass = org.mokylin.skin.app.siwangfuhuo.Itemkuang_Skin;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.bold = true;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.letterSpacing = 1;
			temp.text = "获取神器";
			temp.textAlign = "center";
			temp.color = 0xcfc6ae;
			temp.width = 136;
			temp.x = 2;
			temp.y = 8;
			return temp;
		}

		private function mc_star1_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_star1 = temp;
			temp.name = "mc_star1";
			temp.autoPlay = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleClass = org.mokylin.skin.app.siwangfuhuo.mc.xingxing_Skin;
			temp.width = 20;
			temp.x = 13;
			temp.y = 151;
			return temp;
		}

		private function mc_star2_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_star2 = temp;
			temp.name = "mc_star2";
			temp.autoPlay = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleClass = org.mokylin.skin.app.siwangfuhuo.mc.xingxing_Skin;
			temp.width = 20;
			temp.x = 38;
			temp.y = 151;
			return temp;
		}

		private function mc_star3_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_star3 = temp;
			temp.name = "mc_star3";
			temp.autoPlay = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleClass = org.mokylin.skin.app.siwangfuhuo.mc.xingxing_Skin;
			temp.width = 20;
			temp.x = 63;
			temp.y = 151;
			return temp;
		}

		private function mc_star4_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_star4 = temp;
			temp.name = "mc_star4";
			temp.autoPlay = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleClass = org.mokylin.skin.app.siwangfuhuo.mc.xingxing_Skin;
			temp.width = 20;
			temp.x = 87;
			temp.y = 151;
			return temp;
		}

		private function mc_star5_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_star5 = temp;
			temp.name = "mc_star5";
			temp.autoPlay = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleClass = org.mokylin.skin.app.siwangfuhuo.mc.xingxing_Skin;
			temp.width = 20;
			temp.x = 112;
			temp.y = 151;
			return temp;
		}

	}
}