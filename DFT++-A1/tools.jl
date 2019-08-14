pyplot()

function view(IM, S, coorM; nx=1,ny=1,nz=1)
    N_v = Vector{Vector{Float64}}(undef, prod(S))
    for i in 1:prod(S)
        N_v[i] = coorM[i,:]
    end
    
    IMxyz = reshape(IM, S...)
    xyz = reshape(N_v, S...)
    
    # xy plane
    IMxy = IMxyz[:,:,nz]
    xy = xyz[:,:,nz]
    
    IMxy = IMxy[:]
    len = length(IMxy)
    x = zeros(len)
    y = zeros(len)
    for i in 1:len
        x[i] = xy[:][i][1]
        y[i] = xy[:][i][2]
    end
    p1 = surface(x,y,IMxy[:])
    
    # xz plane
    IMxz = IMxyz[:,ny,:]
    xz = xyz[:,ny,:]
    
    IMxz = IMxz[:]
    len = length(IMxz)
    x = zeros(len)
    z = zeros(len)
    for i in 1:len
        x[i] = xz[:][i][1]
        z[i] = xz[:][i][3]
    end
        
    p2 = surface(x,z,IMxz[:])
    
    # yz plane
    IMyz = IMxyz[nx,:,:]
    yz = xyz[nx,:,:]
    
    IMyz = IMyz[:]
    len = length(IMyz)
    y = zeros(len)
    z = zeros(len)
    for i in 1:len
        y[i] = yz[:][i][2]
        z[i] = yz[:][i][3]
    end
        
    p3 = surface(y,z,IMyz[:])
    
    plot(p1, p2, p3, layout=3)
end