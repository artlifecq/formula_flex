package org.mokylin.skin.app.jianghu.lunjian
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
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

		public var mc_nandu:feathers.controls.UIMovieClip;

		public var uiBg:feathers.controls.UIAsset;

		public var uiLingqu:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function LunJian_Nandu()
		{
			super();
			
			this.currentState = "normal";
			this.height = 89;
			this.width = 71;
			this.elementsContent = [uiBg_i(),mc_nandu_i(),Icon_i(),uiLingqu_i()];
			
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
			temp.height = 50;
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.width = 50;
			temp.x = 15;
			temp.y = 6;
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
			temp.x = 26;
			temp.y = 66;
			return temp;
		}

		private function uiBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiBg = temp;
			temp.name = "uiBg";
			temp.styleName = "ui/app/jianghu/lunjian/xz.png";
			temp.x = 10;
			temp.y = 0;
			return temp;
		}

		private function uiLingqu_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLingqu = temp;
			temp.name = "uiLingqu";
			temp.styleName = "ui/app/jianghu/lunjian/ylq.png";
			temp.x = 0;
			temp.y = 25;
			return temp;
		}

	}
}