package org.mokylin.skin.app.jianghu.lunjian
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.jianghu.mc.UIMovieClipDiKuang;
	import org.mokylin.skin.app.jianghu.mc.UIMovieClipNandu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class LunJian_Nandu extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon:feathers.controls.UIAsset;

		public var mc_dikuang:feathers.controls.UIMovieClip;

		public var mc_nandu:feathers.controls.UIMovieClip;

		public var uiLingqu:feathers.controls.UIAsset;

		public var uiOk:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function LunJian_Nandu()
		{
			super();
			
			this.currentState = "normal";
			this.height = 96;
			this.width = 70;
			this.elementsContent = [Icon_i(),uiOk_i(),uiLingqu_i(),mc_nandu_i(),mc_dikuang_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon = temp;
			temp.name = "Icon";
			temp.styleName = "ui/app/jianghu/lunjian/tbk.png";
			temp.x = 11;
			temp.y = 13;
			return temp;
		}

		private function mc_dikuang_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_dikuang = temp;
			temp.name = "mc_dikuang";
			temp.autoPlay = false;
			temp.height = 96;
			temp.styleClass = org.mokylin.skin.app.jianghu.mc.UIMovieClipDiKuang;
			temp.width = 70;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function mc_nandu_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_nandu = temp;
			temp.name = "mc_nandu";
			temp.autoPlay = false;
			temp.height = 17;
			temp.styleClass = org.mokylin.skin.app.jianghu.mc.UIMovieClipNandu;
			temp.width = 30;
			temp.x = 21;
			temp.y = 71;
			return temp;
		}

		private function uiLingqu_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLingqu = temp;
			temp.name = "uiLingqu";
			temp.styleName = "ui/app/jianghu/lunjian/ylq.png";
			temp.visible = false;
			temp.x = 9;
			temp.y = 69;
			return temp;
		}

		private function uiOk_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiOk = temp;
			temp.name = "uiOk";
			temp.styleName = "ui/app/jianghu/lunjian/ywc.png";
			temp.x = 15;
			temp.y = 17;
			return temp;
		}

	}
}