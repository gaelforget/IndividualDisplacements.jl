
using PyPlot, PyCall
import Drifters.DataFrames: DataFrame, groupby

"""
    PlotMapProj(df::DataFrame,nn::Integer)

Plot random subset of size nn trajectories using PyPlot & basemap.
"""
function PlotMapProj(df::DataFrame,nn::Integer)

   #PyPlot.figure()

   # Set up Equidistant cylindrical map projection. Use low resolution coastlines.
   ccrs=pyimport("cartopy.crs")
   #ax = plt.axes(projection=ccrs.Orthographic(central_latitude=-90.0,central_longitude=-160.0))
   ax = plt.axes(projection=ccrs.PlateCarree(central_longitude=-160.0))
   ax.coastlines(linewidth=0.3)
   ax.stock_img()

   # Draw trajectories
   IDs = Drifters.randperm(maximum(df.ID))
   COs=["w" "y" "g" "k"]

   #for global ocean case:
   dMax=90.
   println("dMax=$dMax")

   for ii=1:nn
      tmp=df[df.ID .== IDs[ii], :]
      jj=findall(tmp[!,:lon] .< 20)
      tmp[jj,:lon]=tmp[jj,:lon] .+ 360.0;
      if dMax > 0.
         d=abs.(diff(tmp[!,:lon]))
         jj=findall(d .> dMax)
         tmp[jj,:lon].=NaN; tmp[jj,:lat].=NaN
         d=abs.(diff(tmp[!,:lat]))
         jj=findall(d .> dMax)
         tmp[jj,:lon].=NaN; tmp[jj,:lat].=NaN
      end
      #
      CO=COs[mod(ii,4)+1]
      plt.plot(tmp[!,:lon], tmp[!,:lat], color=CO, linewidth=0.2, transform=ccrs.Geodetic() )
   end

   #to display the figure in JUNO (not needed in REPL or Jupyter):
   #gcf()

end
